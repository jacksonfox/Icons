# Icon Manager

Icon Manager is a small Sinatra app that makes it easier to manage and preview the icon sets you have. It's still *very* rouge around the edges. 

Adding your icon sets:

* Copy your icons into a directory underneath `/public/icons` (ex. `/public/icons/silk-icons`)
* Put a file named README in this directory, it should look like this:

      ---
      name: Silk
      url: http://www.famfamfam.com/lab/icons/silk/
      creator: Mark James
      labels: all purpose, 16x16
      ---
      "Silk" is a smooth, free icon set, containing over **700** 16-by-16
      pixel icons in strokably-soft PNG format. Containing a large variety 
      of icons, you're sure to find something that tickles your fancy. And 
      all for a low low price of **$0.00**. You can't say fairer than that.

The icon set description can be formatted using [Markdown](http://daringfireball.net/projects/markdown/).

## Todo List

* Clean up stylesheets
* Figure out how to manage multiple icon sizes within a set
* Filter icon sets by tags