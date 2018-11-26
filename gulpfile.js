var gulp = require('gulp');
var child = require('child_process');
var webpack = require('webpack-stream');
var browserSync = require('browser-sync').create();

function catchError (error) {
  console.log(error.toString());
  this.emit('end');
}

gulp.task('webpack', function () {
	return gulp.src('src/main.js')
		.pipe(webpack( require('./webpack.config.js'), require('webpack') ))
		.on('error', catchError)
		.pipe(gulp.dest('dist/'));
});

gulp.task('server', function (done) {
	child.spawn('node', ['server.js']);
	done();
});

gulp.task('watch', ['webpack'], function (done) {
	browserSync.reload();
	done();
});

gulp.task('default', ['webpack', 'server'], function () {
	browserSync.init({
		proxy: "http://localhost:3002",
		notify: false,
		logLevel: "silent"
	});

	gulp.watch("src/**/*.js", ['watch']);
	gulp.watch("src/**/*.css", ['watch']);
	gulp.watch("src/index.html", ['watch']);
	gulp.watch("src/main.js", ['watch']);
	gulp.watch("server.js", ['server', 'watch']);

	setTimeout(()=>console.log("Application started!"),1);
});
