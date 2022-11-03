<!-- TABLE OF CONTENTS -->
<h2 id="table-of-contents"> :book: Table of Contents</h2>

<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#techical-requirements"> ➤ Technical Requirements</a></li>
    <li><a href="#project-files-description"> ➤ Project Files Description</a></li>
    <li><a href="#getting-started"> ➤ Getting Started</a></li>
    <li><a href="#Routes"> ➤ Routes</a></li>
    <li><a href="#Schema"> ➤ Schema</a></li>
    <li><a href="#credits"> ➤ Credits</a></li>
  </ol>
 </details>
 
 <!-- TECHNICAL REQUIREMENTS -->
<h2 id="techical-requirements"> 💻 Technical Requirements</h2>
<ul>
  <li>Ruby 2.7.4</li>
  <li>Rails 5.2.6</li>
  <li>RSpec-Rails 5.1.2</li>
  <li>Webmock</li>
  <li>VCR</li>
  <li>Capybara</li>
  <li>SimpleCov</li>
  <li>Launchy</li>
  <li>Orderly</li>
  <li>Shoulda-Matchers</li>
  </ul>
  
 <!-- PROJECT FILES DESCRIPTION -->
<h2 id="project-files-description"> :floppy_disk: Project Files Description</h2>

<ul>
  <li><b>app/controllers</li></b>
  <ol>
  <li>Contains several controllers allowing a user to create edit and cancel a subscription</li></ol>
</ul>

<!-- ROUTES -->
<h2 id="Routes"> :open_file_folder: Routes</h2>

| Rails Routes  |  |  |
| ------------- | ------------- | ------------- |
| root  | welcome#index  | goes to welcome index page  |
| resources  | api/v1/subscription  | subscription  |

  <!-- GETTING STARTED -->
<h2 id="getting-started"> :book: Getting Started</h2>

<p><b>1. </b> Create a new directory on your computer where you'd like the program to live.</p>
<pre><code>$ mkdir /your_folder/take_home_project</code></pre>

<p><b>2. </b> Navigate into the recently created directory.</p>
<pre><code>$ cd /your_folder/take_home_project</code></pre>

<p><b>3. </b> Copy the repository by clicking on the code button on Github repo page (using SSH).</p>
<img src="https://user-images.githubusercontent.com/54329737/199787268-10a06a27-043d-4fa6-9740-77d60968dcc1.png" width=30% height=30%>

<p><b>4. </b> Clone the recently copied repository information into your currenty directory.</p>
<pre><code>$ git clone git@github.com:wes30303/take_home_project.git</code></pre>

<p><b>5. </b> Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below:</p>
<pre><code>$ code .</code></pre>

<p><b>6. </b> Install dependencies found in Gemfile</a>.</p>
<pre><code>$ bundle install</code></pre>

<p><b>10. </b> Run migrations</p>
<pre><code>$ rails db:{create,migrate,seed}</code></pre>

<!-- Schema -->
<h2 id="Schema"> :scroll: Schema</h2>
<img src="https://user-images.githubusercontent.com/54329737/199785729-9ade3ed2-8b96-433b-8757-d9c35b61ee26.png" width=50% height=50%>
<!-- CREDITS -->

<h2 id="credits"> :scroll: Credits</h2>

<h3>Wesley Miranda</h3>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/wes30303)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/wesley-miranda-80a725196/)
