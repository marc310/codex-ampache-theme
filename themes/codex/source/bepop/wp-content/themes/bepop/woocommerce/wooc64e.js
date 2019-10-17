(function ($) {
  'use strict';

  var init = function(){
    // variation form
    if ( typeof wc_add_to_cart_variation_params !== 'undefined' ) {
      $( '.variations_form' ).each( function() {
        $.fn.wc_variation_form && $( this ).wc_variation_form();
      });
    }

    // tab, rating
    $( '.wc-tabs-wrapper, .woocommerce-tabs, #rating' ).trigger( 'init' );

    // category sorting
    $( '.woocommerce-ordering' ).on( 'change', 'select.orderby', function() {
      $( this ).closest( 'form' ).submit();
    });
    
    // zoom and slider
    
    $( '.woocommerce-product-gallery' ).each( function() {
      wc_single_product_params.zoom_enabled = 1;
      wc_single_product_params.flexslider_enabled = 1;
      $.fn.wc_product_gallery && $( this ).wc_product_gallery( wc_single_product_params );
    } );

    var link = $( '.product_type_variable.add_to_cart_button, .product_type_grouped' );
    link.each(function(){
      $(this).attr('href', link.attr('href')+'#');
      $(this).on('click', function(e) {
        e.preventDefault();
        $('#product-modal').modal();
      });
    });

  }
  // ajax success
  $(document).on('pjax:complete', function() {
    init();
  });

  init();

})(jQuery);
