jQuery(document).ready ($) ->
  montionNav = ->
    nav = $(".-nav-wrapper")
    size = widthWindow()
    if size
      nav.detach()
      nav.insertBefore ".-menu-slide-left"
    else
      nav.detach()
      nav.insertAfter ".-container-main"
  widthWindow = ->
    mediaQuery = window.getComputedStyle(document.querySelector(".-header-nav"), "::before").getPropertyValue("content").replace(/"/g, "")
    mediaQuery  !=  "mobile"
  montionNav()
  $(window).on "resize", ->
    (if (not window.requestAnimationFrame) then setTimeout(montionNav, 300) else window.requestAnimationFrame(montionNav))

  $(".-menu-slide-left").on "click", (event) ->
    event.preventDefault()
    $(".-dropdown-out").removeClass "-dropdown-out"  if $(".-header-nav").hasClass("-is-hidden")
    $(".-header-nav").toggleClass "-is-hidden"
    $(".-dropdown-nav").toggleClass "-is-hidden"
    $(".-container-main").toggleClass "-is-hidden"

  $(".-dropdown-nav-click-return").on "click", (event) ->
    event.preventDefault()
    $(".-dropdown-nav").removeClass "-dropdown-out"

  $(".-dropdown-nav-click").on "click", (event) ->
    event.preventDefault()
    $(".-dropdown-nav").toggleClass "-dropdown-out"