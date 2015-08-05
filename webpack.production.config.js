var path = require('path');
var webpack = require('webpack');

module.exports = {
  // entry: {
  //   app: [
  //     './src/scripts/app',
  //   ],
  // },
  entry: [
    './src/scripts/app',
    './src/styles/main',
  ],
  devtool: 'source-map',
  output: {
      path: path.join(__dirname, "public"),
      filename: "bundle.js",
  },
  resolveLoader: {
    modulesDirectories: ['..', 'node_modules']
  },
  plugins: [
    new webpack.DefinePlugin({
      // This has effect on the react lib size.
      "process.env": {
        NODE_ENV: JSON.stringify("production")
      }
    }),
    new webpack.IgnorePlugin(/vertx/),
    new webpack.IgnorePlugin(/un~$/),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin(),
  ],
  resolve: {
    extensions: ['', '.js', '.cjsx', '.coffee', '.scss']
  },
  module: {
    loaders: [
      {
        test: /\.scss$/,
        loader: "css!autoprefixer-loader!ruby-sass"
      },
      { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
      { test: /\.coffee$/, loader: 'coffee' }
    ]
  }
};
