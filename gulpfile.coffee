gulp = require 'gulp'
shell = require 'gulp-shell'
bowerFiles = require 'main-bower-files'
clean = require 'del'
uglify = require 'gulp-uglify'
filter = require 'gulp-filter'
concat = require 'gulp-concat'
js_minify = require 'gulp-ngmin'
preprocess = require 'gulp-preprocess'
gutil = require 'gulp-util'
coffee = require 'gulp-coffee'
changed = require 'gulp-changed'
coffeelint = require 'gulp-coffeelint'
css_minify = require 'gulp-minify-css'
ngAnnotate = require 'gulp-ng-annotate'
html_minify = require 'gulp-minify-html'
sass = require 'gulp-sass'

jsFilter = filter "**/*.js", {restore: true}
cssFilter = filter "**/*.css", {restore: true}
fontFilter = filter ["**/*.eot", "**/*.woff", "**/*.ttf", "**/*.svg", "**/*.otf", "**/*.woff2"], {restore: true}

src = 'src'
dest = 'public'
name = 'ecommerce'

gulp.task 'clean', ->
  clean.sync "#{dest}/*"

gulp.task 'bower', ->
  gulp.src bowerFiles()
  .pipe cssFilter
  .pipe concat('libs.min.css')
  .pipe gulp.dest "#{dest}/css"
  .pipe cssFilter.restore
  .pipe jsFilter
  .pipe concat "libs.js"
  .pipe gulp.dest "#{dest}/js"
  .pipe jsFilter.restore
  .pipe fontFilter
  .pipe gulp.dest "#{dest}/fonts/"
  .pipe fontFilter.restore

gulp.task 'coffee', ->
  gulp.src ["#{src}/bootstrap.coffee", "#{src}/controller/*.coffee", "#{src}/directives/*.coffee",
    "#{src}/factory/*.coffee"]
  .pipe changed "#{dest}/js", {extention: '.js'}
  .pipe preprocess()
  .pipe coffee({bare: true}).on('error', gutil.log)
  .pipe concat "#{name}.js"
  .pipe ngAnnotate()
  .pipe gulp.dest "#{dest}/js"

gulp.task 'js', ->
  gulp.src "#{src}/js/*.js"
  .pipe concat "#{name}-animation.js"
  .pipe gulp.dest "#{dest}/js"

gulp.task 'sassToCss', ->
  gulp.src ["#{src}/css/*.scss", "#{src}/css/*.sass"]
  .pipe(sass().on('error', sass.logError))
  .pipe changed "#{dest}/css}"
  .pipe concat "#{name}-styles.css"
  .pipe gulp.dest "#{dest}/css"

gulp.task 'copy',['bower'], ->
  gulp.src "#{src}/index.html"
  .pipe gulp.dest "#{dest}"
  gulp.src "#{src}/view/*.html"
  .pipe gulp.dest "#{dest}/templates/"
  gulp.src "#{src}/modal/*.html"
  .pipe gulp.dest "#{dest}/modal/"
  gulp.src "#{src}/*.xlsx"
  .pipe gulp.dest "#{dest}"
  gulp.src "bower_components/alasql/dist/alasql.min.js"
  .pipe gulp.dest "#{dest}/js"
  gulp.src "#{src}/font/*"
  .pipe gulp.dest "#{dest}/font"

gulp.task 'img_copy', ->
  gulp.src "#{src}/img/**/*"
  .pipe gulp.dest "#{dest}/img/"


gulp.task 'default', ['clean', 'bower', 'sassToCss', 'coffee', 'js', 'copy'], ->
  console.log "done !"
