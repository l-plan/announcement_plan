const { environment } = require('@rails/webpacker')


const coffee =  require('./loaders/coffee')
const webpack = require('webpack')

// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery',
//     jquery: 'jquery/src/jquery'

//   })
// )
// resolve-url-loader must be used before sass-loader
// environment.loaders.get('sass').use.splice(-1, 0, {
//     loader: 'resolve-url-loader',
//     options: {
//         attempts: 1
//     }
// });


// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend('Provide', new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        JQuery: 'jquery/src/jquery',
        jquery: 'jquery/src/jquery',
        'window.Tether': "tether"
        // Popper: ['popper.js', 'default'], // for Bootstrap 4
    })
)





const aliasConfig = {
    'jquery': 'jquery/src/jquery',
    'jquery-ui': 'jquery-ui-dist/jquery-ui.js'

};

environment.config.set('resolve.alias', aliasConfig);


environment.loaders.prepend('coffee', coffee)
module.exports = environment