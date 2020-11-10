const path = require('path');
module.exports = {
  entry: {
  	 app: './src/index.js'
  },
  devServer: {
    contentBase: path.join(__dirname, 'dist'),
    compress: true,
    port: 9000,
    hot: true
  },
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  },
  externals: {
    phaser: 'window.Phaser'
  }
};