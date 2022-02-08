<div data-target="readme-toc.content" class="Box-body px-5 pb-5">
          <article class="markdown-body entry-content container-lg" itemprop="text"><h1 dir="auto"><a id="user-content-things-you-should-know" class="anchor" aria-hidden="true" href="#things-you-should-know"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>Things you should know:</h1>
<ul dir="auto">
<li>The code was built for Old QBCore, you can of course change it to new if you want. (If you need help feel free to ask)</li>
<li>Make sure you change in config.lua to your Core. <code>Config.TriggerPrefix = "FrameWork"</code> -- Change "FrameWork".</li>
<li>All player outfits data will be saved to the player in a database.json file. for example - <code>{"OVZ61343":[]}</code></li>
<li>You will need to change the menu export in client.lua -> line 180. <code>exports["nc-menu"]:openMenu(menu)</code> - this is important. Without the above menu you will not be able to see which outfits you have saved.</li>
<li>To add more places where you can use outfits you can see at client.lua -> line 14. <code>local Locations = {</code></li>
<li>If you have any further questions, you can add me to Discord.</li>
</ul>
<h1 dir="auto"><a id="user-content-faq" class="anchor" aria-hidden="true" href="#faq"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.775 3.275a.75.75 0 001.06 1.06l1.25-1.25a2 2 0 112.83 2.83l-2.5 2.5a2 2 0 01-2.83 0 .75.75 0 00-1.06 1.06 3.5 3.5 0 004.95 0l2.5-2.5a3.5 3.5 0 00-4.95-4.95l-1.25 1.25zm-4.69 9.64a2 2 0 010-2.83l2.5-2.5a2 2 0 012.83 0 .75.75 0 001.06-1.06 3.5 3.5 0 00-4.95 0l-2.5 2.5a3.5 3.5 0 004.95 4.95l1.25-1.25a.75.75 0 00-1.06-1.06l-1.25 1.25a2 2 0 01-2.83 0z"></path></svg></a>FAQ</h1>
<h2 dir="auto"></h2>
<p dir="auto"><strong>Q:</strong> Is it possible to activate it through eye target?</p>
<p dir="auto"><strong>A:</strong> No, it works by command only.</p>
<h2 dir="auto"></h2>
<h2 dir="auto"></h2>
<p dir="auto"><strong>Q:</strong> What commands will I need to use?</p>
<p dir="auto"><strong>A:</strong> /saveoutfit 1-25 - You will need to use near the store (when you want to keep your current outfits) <br> /outfits - see the outfits you saved & option to delete them.</p>
<h2 dir="auto"></h2>
