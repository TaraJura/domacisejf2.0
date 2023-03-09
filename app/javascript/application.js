// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


let myDropzone = new Dropzone("form#myId", { url: "/instances/file"});
