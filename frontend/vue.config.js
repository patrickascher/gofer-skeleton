var CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = {
    runtimeCompiler: true,
    transpileDependencies: [
        'vuetify'
    ],
    configureWebpack: {
        plugins: [
            new CopyWebpackPlugin([
                {from: 'src/assets/lang', to: 'lang'}
            ]),
        ]
    }
}
