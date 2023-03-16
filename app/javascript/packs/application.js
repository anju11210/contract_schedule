// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// NOTE:javascriptを走らせる
$(document).ready(function () {
// NOTE:各種タグの取得
const input = document.querySelector(".text-field");
const area = document.querySelector(".text-area");
const button = document.querySelector(".js-submit");
// NOTE:keyupイベントを拾う（キーボードを叩いた瞬間にボタンを発火させる）
window.addEventListener("keyup", () => {
 if (input.value != "" && area.value != "") {
   // NOTE:成功した場合は、disabledをfalseに（ボタンを押せるようにする）
   button.disabled = false;
 } else {
   // NOTE:失敗した場合は、disabledをtrueに（ボタンを押せないままにする）
   button.disabled = true;
 }
});

});

