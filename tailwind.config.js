/* eslint-disable */ 
module.exports = {
  purge: [],
  darkMode: false,
  theme: {
    extend: {
      minHeight: {
        200: '200px',
        51: '51vh'
      },
      maxWidth: {
        90: '90px', 
        452: '452px',
      },
      width: {
        452: '452px',
      },
      height: {
        452: '452px',
      },
      fontFamily: {
        sans: [
          'Roboto',
          'ui-sans-serif',
          'system-ui',
          '-apple-system',
          'BlinkMacSystemFont',
          'Segoe UI',
          'Helvetica Neue',
          'Arial',
          'Noto Sans',
          'sans-serif',
          'Apple Color Emoji',
          'Segoe UI Emoji',
          'Segoe UI Symbol',
          'Noto Color Emoji',
        ],
        serif: ['Roboto', 'ui-serif', 'Georgia', 'Cambria', 'Times New Roman', 'Times', 'serif'],
        mono: [
          'Roboto',
          'ui-monospace',
          'SFMono-Regular',
          'Menlo', 'Monaco',
          'Consolas',
          'Liberation Mono',
          'Courier New',
          'monospace',
        ],
      },
      colors: {
        red: {
          550: '#ee374d',
        },
      },
    },

  },
  variants: {
    extend: {
      display: ['group-hover']
    },
  },
  plugins: [],
};
