jQuery(document).ready(function(){
	
	$ = jQuery;	

    /*-----------------------------------------------------------------------------------*/
    /*	Forms Validation
    /*-----------------------------------------------------------------------------------*/
	/*
	if( jQuery().validate ){
			
			// Contact Options
			
			var contact_options = { 
				target: '#message-sent',
				beforeSubmit: function(){
										$('#contact-loader').fadeIn('fast');
										$('#message-sent').fadeOut('fast');
								}, 
				success: function(responseText, statusText, xhr, $form){
									
									$('#contact-loader').fadeOut('fast');
									$('#message-sent').fadeIn('fast');
									
									if( responseText == "Wrong Code!" )
									{
										// wrong code
									}
									else
									{														
										$('#contact-form').resetForm();
									}
								}
		    }; 						  	
			
			// Contact Form AJAX Function
			
			$("#contact-form").validate({
				errorLabelContainer: $("#contact-form div.error-container"),
				submitHandler: function(form) {
				   			$(form).ajaxSubmit(contact_options);
				   }
			});
			
			
			// Appointment Form Options
			
			var appointment_options = { 
				target: '#apo-message-sent',
				beforeSubmit: function(){
										$('#apo-loader').fadeIn('fast');
										$('#apo-message-sent').fadeOut('fast');
								}, 
				success: function(responseText, statusText, xhr, $form){
					
									$('#apo-loader').fadeOut('fast');
									$('#apo-message-sent').fadeIn('fast');
									
									if( responseText == "Wrong Code!" )
									{
										// wrong code
									}
									else
									{														
										$('#appoint-form').resetForm();
									}
																		
								}
		    }; 
		  
			
			// Appointment Form AJAX Function
			
			$("#appoint-form").validate({
				errorLabelContainer: $("#appoint-form .error-container"),
				submitHandler: function(form) {
				   			$(form).ajaxSubmit(appointment_options);
				   }
			});
			
			// Newsletter Form
			
			$('#newsletter').validate({
				    errorLabelContainer: $("#newsletter .error-container")
				});
			
	}*/
		
    /*-----------------------------------------------------------------------------------*/
    /*	FAQ Code
    /*-----------------------------------------------------------------------------------*/
	// on page load	
	$('.faq-unit').not('.faq-unit.active').find('.faq-answer').slideUp('slow');
	$('.faq-unit').first().addClass('active').find('.faq-answer').slideDown('slow');
	
	$('.faq-unit').click(function(e){		
		var $this = $(this);
		if( !$this.hasClass('active') )
		{
			$('.faq-unit.active').removeClass('active').find('.faq-answer').slideUp('slow');		
			$this.addClass('active').find('.faq-answer').slideDown('slow');
		}
	});


    /*-----------------------------------------------------------------------------------*/
    /*	Isotope
    /*-----------------------------------------------------------------------------------*/
	    
	    jQuery(function() {

            var container = jQuery('.isotope'),
                filterLinks = jQuery('#filter-by a');
            
            filterLinks.click(function(e){
                var selector = jQuery(this).attr('data-filter');
                container.isotope({ 
                    filter : '.' + selector, 
                    itemSelector : '.isotope-item',
                    layoutMode : 'fitRows',
                    animationEngine : 'best-available'
                });
                
                filterLinks.removeClass('active');
				jQuery('#filter-by li').removeClass('current-cat');
                jQuery(this).addClass('active');
               	e.preventDefault();
            });
            
	    });

	/*----------------------------------------------------------------------------------*/
	/*	Form AJAX validation and submition
	/*  Validation Plugin : http://bassistance.de/jquery-plugins/jquery-plugin-validation/
	/*	Form Ajax Plugin : http://www.malsup.com/jquery/form/
	/*---------------------------------------------------------------------------------- */
	if( jQuery().validate ){

		// Appointment Form Options
		var login_options = {
			url:"login.do?method=login",
			target: '#apo-message-sent',
			beforeSubmit: function(){
				$('#apo-loader').fadeIn('fast');
				$('#apo-message-sent').fadeOut('fast');
			},
			success: function(responseText, statusText, xhr, $form){

				$('#apo-loader').fadeOut('fast');
				$('#apo-message-sent').fadeIn('fast');

				if( responseText.trim() == "false" )
				{
					// wrong code
					alert("登录失败！请检查用名和密码！");
					$('#login-form').resetForm();
				}
				else
				{
					alert("登录成功！");
					location.href = "personcenter/bloodpressure.jsp";
				}

			}
		};


		// Login Form AJAX Function
		$("#login-form").validate({
			errorLabelContainer: $("#login-form .error-container"),
			submitHandler: function(form) {
				$(form).ajaxSubmit(login_options);
			}
		});

	}

 
 			
});