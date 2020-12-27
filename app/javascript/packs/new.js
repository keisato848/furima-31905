$(function(){
  $( '#item-price' ).on( 'input', function(){ 
    let amount = $( this ).val();
    let fee = Math.ceil(amount * 0.1);
    let profit = Math.floor(amount * 0.9);
    $('#add-tax-price').html(fee);
    $('#profit').html(profit);
  });
});