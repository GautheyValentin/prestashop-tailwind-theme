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
  process.env.NODE_ENV =  env.mode;

  const buildDirPath = path.join(__dirname, '.build/');


  const jsDir = 'assets/js';
  const coreDir = '../';
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
    core: {
      path: isToZip ? path.join(buildDirPath) : path.join(__dirname, '../', coreDir),
      filename: 'core.js',
    },
    style: {
      path: isToZip ? path.join(buildDirPath, styleDir) : path.join(__dirname, '../', styleDir),
    },
  };

  return [{
    mode: env.mode,
    entry: './src/js/theme.ts',
    output: output.js,
    module: {
      rules: [{
        test: /\.ts$/,
        exclude: /node_modules/,
        use: ['ts-loader'],
      }],
    },
    resolve: {
      extensions: ['.ts'],
    },
    externals: {
      prestashop: 'prestashop',
      $: '$',
      jquery: 'jQuery',
    },
    optimization: {
      minimize: !!isProduction,
    },
  }, 
  {
    mode: env.mode,
    entry: './src/js/core/theme.js',
    output: output.core,
    module: {
      rules: [
        {
          test: /\.js$/,
          use: {
            loader: 'babel-loader',
            options: {
              presets: ['@babel/preset-env'],
            },
          },
        },
      ],
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
  },
  {
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
          use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader', 'sass-loader'],
        },
        {
          test: /\.(png|jpe?g|gif|svg)$/i,
          loader: 'file-loader',
          options: {
            name: '[name].[hash].[ext]',
          },
        },
        {
          test: /\.(woff(2)?|ttf|eot)$/,
          type: 'asset/resource',
          generator: {
              filename: './fonts/[name][ext]',
          },
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
