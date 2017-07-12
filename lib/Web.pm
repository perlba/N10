package Web;
use Dancer2;


 my $flash;

 sub set_flash {
     my $message = shift;

     $flash = $message;
 }

 sub get_flash {

     my $msg = $flash;
     $flash = "";

     return $msg;
 } 




    

    hook before => sub {
        if (!session('user') && request->dispatch_path !~ m{^/login}) {
            forward '/login', { requested_path => request->dispatch_path };
        }
    };

    get '/' => sub { template '/index'; };
    
    
     get '/Step01' => sub {
                      template 'index';
                      };
    
    
    post '/' => sub {
                          
                    template 'Step01', { path => param('requested_path') };
    };
                     
   
    
     get '/' => sub { template '/index'; };
    
    get '/Step02' => sub { 
                           template 'index';
                      };
    
    
    post '/Step02' => sub {
                          
                    template 'Step02', { path => param('requested_path') };
    };
    
    
    
    get '/Step03' => sub {
                      template 'index';
                      };
    
    
    post '/Step03' => sub {
                          
                    template 'Step03', { path => param('requested_path') };
    };
    
    
    
    get '/Step04' => sub {
                      template 'index';
                      };
    
    
    post '/Step04' => sub {
                          
                    template 'Step04', { path => param('requested_path') };
    };
    
    
    get '/Step05' => sub {
                      template 'index';
                      };
    
    
    post '/Step05' => sub {
                          
                    template 'Step05', { path => param('requested_path') };
    };
    
    
    get '/Step06' => sub {
                      template 'index';
                      };
    
    
    post '/Step06' => sub {
                          
                    template 'Step06', { path => param('requested_path') };
    };
    
    
    get '/Step07' => sub {
                      template 'index';
                      };
    
    
    post '/Step07' => sub {
                          
                    template 'Step07', { path => param('requested_path') };
    };
    
    
    get '/Step08' => sub {
                      template 'index';
                      };
    
    
    post '/Step08' => sub {
                          
                    template 'Step08', { path => param('requested_path') };
    };
    
    
    
    get '/Step09' => sub {
                      template 'index';
                      };
    
    
    post '/Step09' => sub {
                          
                    template 'Step09', { path => param('requested_path') };
    };
    
    
    
    
    
    
    

    
    get '/login' => sub {
        # Display a login page; the original URL they requested is available as
        # param('requested_path'), so could be put in a hidden field in the form
        template 'login', { path => param('requested_path') };
    };

    post '/login' => sub {
        # Validate the username and password they supplied
        if (param('user') eq 'edin' && param('pass') eq 'E2') {
            session user => param('user');
            redirect param('path') || '/';
        } else {
            redirect '/login?failed=1'; 
        }
    };
    
    get '/logout' => sub {
    app->destroy_session;
    set_flash('You are logged out.');
    redirect '/';};

    dance();
