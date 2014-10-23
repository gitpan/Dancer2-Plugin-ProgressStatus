Dancer2::Plugin::ProgressStatus
==============================

[![Build Status](https://travis-ci.org/shumphrey/Dancer2-Plugin-ProgressStatus.png?    branch=master)](https://travis-ci.org/shumphrey/Dancer2-Plugin-ProgressStatus)

A Dancer2 plugin that provides progress status helpers.

To install this module from source:

````shell
  dzil install
````

To use this module in your Dancer2 route:

````perl
  use Dancer2;
  use Dancer2::Plugin::ProgressStatus;

  get '/route' => sub {
    my $prog = start_progress_status('progress1');
    while($some_condition) {
        $prog++;
    }
  };
````

Then with some javascript on the front end, something like this:

````javascript
      function displayProgress(data, done) {
          var prog = (data.count / data.total) * 100;
          $('#progress').html(Math.round(prog) + '%');
          if ( done ) {
              $('#progress').append("<br />Done!");
          }
      }
      function checkProgress() {
          $.getJSON('/_progressstatus/test', function(data) {
              if ( !data.in_progress ) {
                  displayProgress(data, true);
                  return;
              }
              displayProgress(data);
              setTimeout(checkProgress, 3000)
          })
      }

      checkProgress();
````
