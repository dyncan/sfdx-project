const gulp = require('gulp')
const zip = require('gulp-zip')
const shell = require('gulp-shell')
gulp.task('deploy', ['build'], shell.task('sfdx force:source:push'))
gulp.task('build', () =>{
    console.log('build called')
    return gulp.src('static-resources-src/app/*')
        .pipe(zip('app.resource'))
        .pipe(gulp.dest('force-app/main/default/staticresources/'))
})
gulp.task('watch', () => {
    gulp.watch(`static-resources-src/app/**/*.*`, ['deploy'])
})
