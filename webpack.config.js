/* eslint-disable */ 
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');
const CopyPlugin = require('copy-webpack-plugin');
const BrowserSyncPlugin = require('browser-sync-webpack-plugin');
const DotenvWebpackPlugin = require('dotenv-webpack');
const shell = require('shelljs');
const fs = require('fs');
const path = require('path');

require('dotenv').config();

module.exports = (args) => {
  const env = {...args, ...process.env};

  const buildDirPath = path.join(__dirname, '.build/');

  const jsDir = 'assets/js';
  const styleDir = 'assets/css';

  const isProduction = env.mode === 'production';
  const isToZip = env.mode === 'zip';

  if (isToZip) {
    env.mode = 'production';
    if (fs.existsSync(buildDirPath)) shell.rm('-R', buildDirPath);
    shell.mkdir(buildDirPath);
  }

  const output = {
    js: {
      path: isToZip ? path.join(buildDirPath, jsDir) : path.join(__dirname, '../', jsDir),
      filename: 'theme.js',
    },
    style: {
      path: isToZip ? path.join(buildDirPath, styleDir) : path.join(__dirname, '../', styleDir),
    },
  };

  return [{
    mode: env.mode,
    entry: './src/js/theme.js',
    output: output.js,
    module: {
      rules: [{
        test: /\.js$/,
        exclude: /node_modules/,
        use: ['babel-loader'],
      }],
    },
    resolve: {
      extensions: ['.js'],
    },
    externals: {
      prestashop: 'prestashop',
    },
    optimization: {
      minimize: !!isProduction,
    },
  }, {
    mode: env.mode,
    entry: './src/scss/theme.scss',
    output: output.style,
    plugins: [
      new DotenvWebpackPlugin(),
      new MiniCssExtractPlugin({
        filename: 'theme.css',
      }),
      new BrowserSyncPlugin({
        files: '**/*.*',
        proxy: process.env.BROWSER_PROXY,
        port: process.env.BROWSER_PORT,
        https: process.env.BROWSER_HTTPS === 'true',
      }),
      new CopyPlugin({
        patterns: [
          {from: './src/templates', to: '../../templates'},
          {from: './src/modules', to: '../../modules'},
          {from: './src/preview.png', to: '../../'},
          {from: './src/theme.yml', to: '../../config'},
          {from: './src/.htaccess', to: '../../config'},
        ],
      }),
    ],
    resolve: {
      extensions: ['.sass', '.css', 'scss'],
    },
    module: {
      rules: [
        {
          test: /\.(css|sass|scss)$/,
          use: [
            {
              loader: MiniCssExtractPlugin.loader,
              options: {
                publicPath: '',
              },
            },
            {
              loader: 'css-loader',
            },
            {
              loader: 'postcss-loader',
            },
            {
              loader: 'sass-loader',
            },
          ],
        },
        {
          test: /\.(png|jpe?g|gif|svg)$/i,
          loader: 'file-loader',
          options: {
            name: '[name].[hash].[ext]',
          },
        },
        {
          test: /\.(woff(2)?|ttf|eot|svg)(\?v=\d+\.\d+\.\d+)?$/,
          use: [
            {
              loader: 'file-loader',
              options: {
                name: '[name].[hash].[ext]',
              },
            },
          ],
        },
      ],
    },
    optimization: {
      minimize: !!isProduction,
      minimizer: [
        new CssMinimizerPlugin(),
      ],
    },
  }];
};
