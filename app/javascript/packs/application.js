require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'jquery'
import('src/plugins') // loads async

import 'css/site'

Turbolinks.setProgressBarDelay(25)