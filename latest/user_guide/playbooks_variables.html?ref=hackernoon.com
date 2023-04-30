<!DOCTYPE html>
<html class="writer-html5" lang="en" >
<head>
  <meta charset="utf-8" /><meta name="generator" content="Docutils 0.17.1: http://docutils.sourceforge.net/" />

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Using Variables &mdash; Ansible Documentation</title>
      <link rel="stylesheet" href="../_static/pygments.css" type="text/css" />
      <link rel="stylesheet" href="../_static/css/ansible.css" type="text/css" />
      <link rel="stylesheet" href="../_static/antsibull-minimal.css" type="text/css" />
      <link rel="stylesheet" href="../_static/css/rtd-ethical-ads.css" type="text/css" />
    <link rel="shortcut icon" href="_static/images/Ansible-Mark-RGB_Black.svg"/>
    <link rel="canonical" href="https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html"/>
  <!--[if lt IE 9]>
    <script src="../_static/js/html5shiv.min.js"></script>
  <![endif]-->
  
        <script data-url_root="../" id="documentation_options" src="../_static/documentation_options.js"></script>
        <script src="../_static/jquery.js"></script>
        <script src="../_static/underscore.js"></script>
        <script src="../_static/doctools.js"></script>
    <script src="../_static/js/theme.js"></script>
    <link rel="index" title="Index" href="../genindex.html" />
    <link rel="search" title="Search" href="../search.html" />
    <link rel="next" title="Discovering variables: facts and magic variables" href="playbooks_vars_facts.html" />
    <link rel="prev" title="ansible-vault" href="../cli/ansible-vault.html" /><!-- extra head elements for Ansible beyond RTD Sphinx Theme -->
<script src="https://www.redhat.com/dtm.js"></script>


<!-- <meta class="swiftype" name="published_at" data-type="date" content="2017-12-13" /> -->
<meta class="swiftype" name="version" data-type="string" content="6">

<!-- Google Tag Manager Data Layer -->
<script>
 dataLayer = [];
</script>
<!-- End Google Tag Manager Data Layer -->



<script>
  (function(w,d,t,u,n,s,e){w['SwiftypeObject']=n;w[n]=w[n]||function(){
  (w[n].q=w[n].q||[]).push(arguments);};s=d.createElement(t);
  e=d.getElementsByTagName(t)[0];s.async=1;s.src=u;e.parentNode.insertBefore(s,e);
  })(window,document,'script','https://s.swiftypecdn.com/install/v2/st.js','_st');

_st('install','yABGvz2N8PwcwBxyfzUc','2.0.0');
</script>

</head>

<body class="wy-body-for-nav"><!-- extra body elements for Ansible beyond RTD Sphinx Theme -->
<!-- Google Tag Manager -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PSB293" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0], j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f); })(window,document,'script','dataLayer','GTM-PSB293');</script>
<!-- End Google Tag Manager -->

<div class="DocSite-globalNav ansibleNav">
  <ul>
    <li><a href="https://www.ansible.com/ansiblefest" target="_blank">AnsibleFest</a></li>
    <li><a href="https://www.ansible.com/tower" target="_blank">Products</a></li>
    <li><a href="https://www.ansible.com/community" target="_blank">Community</a></li>
    <li><a href="https://www.ansible.com/webinars-training" target="_blank">Webinars & Training</a></li>
    <li><a href="https://www.ansible.com/blog" target="_blank">Blog</a></li>
  </ul>
</div>

<a class="DocSite-nav" href="/" style="padding-bottom: 30px;">

  <img class="DocSiteNav-logo"
    src="../_static/images/Ansible-Mark-RGB_White.svg"
    alt="Ansible Logo">
  <div class="DocSiteNav-title">Documentation</div>
</a>
  <div class="wy-grid-for-nav">
    <nav data-toggle="wy-nav-shift" class="wy-nav-side">
      <div class="wy-side-scroll">
        <div class="wy-side-nav-search" >
            <a href="../index.html" class="icon icon-home"> Ansible
          </a>
              <div class="version">
                6
              </div><!--- Based on https://github.com/rtfd/sphinx_rtd_theme/pull/438/files -->

<div class="version">
  
    <div class="version-dropdown">
      <script>
        function switchVersionTo(slug) {
          var current_url_path = window.location.pathname;
          var url_version = current_url_path.search("/6/") > -1
            ? "/6/"
            : "/latest/";
          var new_version_url = current_url_path.replace(url_version, "/" + slug + "/");
          window.location.replace(new_version_url);
        }
      </script>
      <select
          class="version-list"
          id="version-list"
          onchange="switchVersionTo(this.value);"
      >
        
        <option
            value="latest"
            
        >
            latest
        </option>
        
        <option
            value="2.9"
            
        >
            2.9
        </option>
        
        <option
            value="devel"
            
        >
            devel
        </option>
        
      </select>
    </div>
  
</div>
<div role="search">
  <form id="rtd-search-form" class="wy-form" method="get">
    <input type="text" class="st-default-search-input" name="q" placeholder="Search docs" />
    <input type="hidden" name="check_keywords" value="yes" />
    <input type="hidden" name="area" value="default" />
  </form>
</div>
        </div><div class="wy-menu wy-menu-vertical" data-spy="affix" role="navigation" aria-label="Navigation menu">
  
              <p class="caption" role="heading"><span class="caption-text">Ansible getting started</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../getting_started/index.html">Getting started with Ansible</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Installation, Upgrade &amp; Configuration</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../installation_guide/index.html">Installation Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../porting_guides/porting_guides.html">Ansible Porting Guides</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Using Ansible</span></p>
<ul class="current">
<li class="toctree-l1 current"><a class="reference internal" href="index.html">User Guide</a><ul class="current">
<li class="toctree-l2"><a class="reference internal" href="index.html#writing-tasks-plays-and-playbooks">Writing tasks, plays, and playbooks</a></li>
<li class="toctree-l2"><a class="reference internal" href="index.html#working-with-inventory">Working with inventory</a></li>
<li class="toctree-l2"><a class="reference internal" href="index.html#interacting-with-data">Interacting with data</a></li>
<li class="toctree-l2"><a class="reference internal" href="index.html#executing-playbooks">Executing playbooks</a></li>
<li class="toctree-l2"><a class="reference internal" href="index.html#advanced-features-and-reference">Advanced features and reference</a></li>
<li class="toctree-l2 current"><a class="reference internal" href="index.html#table-of-contents">Table of contents</a><ul class="current">
<li class="toctree-l3"><a class="reference internal" href="basic_concepts.html">Ansible concepts</a></li>
<li class="toctree-l3"><a class="reference internal" href="intro_adhoc.html">Introduction to ad hoc commands</a></li>
<li class="toctree-l3"><a class="reference internal" href="cheatsheet.html">Ansible CLI cheatsheet</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_intro.html">Intro to playbooks</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks.html">Working with playbooks</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_best_practices.html">Tips and tricks</a></li>
<li class="toctree-l3"><a class="reference internal" href="become.html">Understanding privilege escalation: become</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_loops.html">Loops</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_delegation.html">Controlling where tasks run: delegation and local actions</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_conditionals.html">Conditionals</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_tests.html">Tests</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_blocks.html">Blocks</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_handlers.html">Handlers: running operations on change</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_error_handling.html">Error handling in playbooks</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_environment.html">Setting the remote environment</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_environment.html#working-with-language-specific-version-managers">Working with language-specific version managers</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_reuse.html">Re-using Ansible artifacts</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_reuse_roles.html">Roles</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_reuse_includes.html">Including and importing</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_tags.html">Tags</a></li>
<li class="toctree-l3"><a class="reference internal" href="intro_inventory.html">How to build your inventory</a></li>
<li class="toctree-l3"><a class="reference internal" href="intro_dynamic_inventory.html">Working with dynamic inventory</a></li>
<li class="toctree-l3"><a class="reference internal" href="intro_patterns.html">Patterns: targeting hosts and groups</a></li>
<li class="toctree-l3"><a class="reference internal" href="connection_details.html">Connection methods and details</a></li>
<li class="toctree-l3"><a class="reference internal" href="command_line_tools.html">Working with command line tools</a></li>
<li class="toctree-l3 current"><a class="current reference internal" href="#">Using Variables</a><ul>
<li class="toctree-l4"><a class="reference internal" href="#creating-valid-variable-names">Creating valid variable names</a></li>
<li class="toctree-l4"><a class="reference internal" href="#simple-variables">Simple variables</a></li>
<li class="toctree-l4"><a class="reference internal" href="#when-to-quote-variables-a-yaml-gotcha">When to quote variables (a YAML gotcha)</a></li>
<li class="toctree-l4"><a class="reference internal" href="#list-variables">List variables</a></li>
<li class="toctree-l4"><a class="reference internal" href="#dictionary-variables">Dictionary variables</a></li>
<li class="toctree-l4"><a class="reference internal" href="#registering-variables">Registering variables</a></li>
<li class="toctree-l4"><a class="reference internal" href="#referencing-nested-variables">Referencing nested variables</a></li>
<li class="toctree-l4"><a class="reference internal" href="#transforming-variables-with-jinja2-filters">Transforming variables with Jinja2 filters</a></li>
<li class="toctree-l4"><a class="reference internal" href="#where-to-set-variables">Where to set variables</a></li>
<li class="toctree-l4"><a class="reference internal" href="#variable-precedence-where-should-i-put-a-variable">Variable precedence: Where should I put a variable?</a></li>
<li class="toctree-l4"><a class="reference internal" href="#using-advanced-variable-syntax">Using advanced variable syntax</a></li>
</ul>
</li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_vars_facts.html">Discovering variables: facts and magic variables</a></li>
<li class="toctree-l3"><a class="reference internal" href="vault.html">Encrypting content with Ansible Vault</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_filters.html">Using filters to manipulate data</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_lookups.html">Lookups</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_prompts.html">Interactive input: prompts</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_module_defaults.html">Module defaults</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_checkmode.html">Validating tasks: check mode and diff mode</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_startnstep.html">Executing playbooks for troubleshooting</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_debugger.html">Debugging tasks</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_strategies.html">Controlling playbook execution: strategies and more</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_async.html">Asynchronous actions and polling</a></li>
<li class="toctree-l3"><a class="reference internal" href="playbooks_advanced_syntax.html">Advanced Syntax</a></li>
<li class="toctree-l3"><a class="reference internal" href="complex_data_manipulation.html">Data manipulation</a></li>
<li class="toctree-l3"><a class="reference internal" href="plugin_filtering_config.html">Rejecting modules</a></li>
<li class="toctree-l3"><a class="reference internal" href="sample_setup.html">Sample Ansible setup</a></li>
<li class="toctree-l3"><a class="reference internal" href="modules.html">Working With Modules</a></li>
<li class="toctree-l3"><a class="reference internal" href="../plugins/plugins.html">Working with plugins</a></li>
<li class="toctree-l3"><a class="reference internal" href="../reference_appendices/playbooks_keywords.html">Playbook Keywords</a></li>
<li class="toctree-l3"><a class="reference internal" href="intro_bsd.html">Ansible and BSD</a></li>
<li class="toctree-l3"><a class="reference internal" href="windows.html">Windows Guides</a></li>
<li class="toctree-l3"><a class="reference internal" href="collections_using.html">Using collections</a></li>
</ul>
</li>
</ul>
</li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Contributing to Ansible</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../community/index.html">Ansible Community Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../community/contributions_collections.html">Ansible Collections Contributor Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../community/contributions.html">ansible-core Contributors Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../community/advanced_index.html">Advanced Contributor Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../dev_guide/style_guide/index.html">Ansible documentation style guide</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Extending Ansible</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../dev_guide/index.html">Developer Guide</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Common Ansible Scenarios</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../scenario_guides/cloud_guides.html">Legacy Public Cloud Guides</a></li>
<li class="toctree-l1"><a class="reference internal" href="../scenario_guides/network_guides.html">Network Technology Guides</a></li>
<li class="toctree-l1"><a class="reference internal" href="../scenario_guides/virt_guides.html">Virtualization and Containerization Guides</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Network Automation</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../network/getting_started/index.html">Network Getting Started</a></li>
<li class="toctree-l1"><a class="reference internal" href="../network/user_guide/index.html">Network Advanced Topics</a></li>
<li class="toctree-l1"><a class="reference internal" href="../network/dev_guide/index.html">Network Developer Guide</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Ansible Galaxy</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../galaxy/user_guide.html">Galaxy User Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../galaxy/dev_guide.html">Galaxy Developer Guide</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Reference &amp; Appendices</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../collections/index.html">Collection Index</a></li>
<li class="toctree-l1"><a class="reference internal" href="../collections/all_plugins.html">Indexes of all modules and plugins</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/playbooks_keywords.html">Playbook Keywords</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/common_return_values.html">Return Values</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/config.html">Ansible Configuration Settings</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/general_precedence.html">Controlling how Ansible behaves: precedence rules</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/YAMLSyntax.html">YAML Syntax</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/python_3_support.html">Python 3 Support</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/interpreter_discovery.html">Interpreter Discovery</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/release_and_maintenance.html">Releases and maintenance</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/test_strategies.html">Testing Strategies</a></li>
<li class="toctree-l1"><a class="reference internal" href="../dev_guide/testing/sanity/index.html">Sanity Tests</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/faq.html">Frequently Asked Questions</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/glossary.html">Glossary</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/module_utils.html">Ansible Reference: Module Utilities</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/special_variables.html">Special Variables</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/tower.html">Red Hat Ansible Automation Platform</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/automationhub.html">Ansible Automation Hub</a></li>
<li class="toctree-l1"><a class="reference internal" href="../reference_appendices/logging.html">Logging Ansible output</a></li>
</ul>
<p class="caption" role="heading"><span class="caption-text">Roadmaps</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../roadmap/ansible_roadmap_index.html">Ansible Roadmap</a></li>
<li class="toctree-l1"><a class="reference internal" href="../roadmap/ansible_core_roadmap_index.html">ansible-core Roadmaps</a></li>
</ul>
<!-- extra nav elements for Ansible beyond RTD Sphinx Theme -->
<!-- changeable widget links to tower - do not change as image controlled by Ansible-->
<div id="sideBanner">
  <br/>
  <a href="https://www.ansible.com/docs-left?utm_source=docs">
    <img style="border-width:0px;" src="https://cdn2.hubspot.net/hubfs/330046/docs-graphics/ASB-docs-left-rail.png" />
  </a>
  <br/><br/><br/>
</div>

        </div>
      </div>
    </nav>

    <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="Mobile navigation menu" >
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">Ansible</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="Page navigation">
  <ul class="wy-breadcrumbs">
      <li><a href="../index.html" class="icon icon-home"></a> &raquo;</li>
          <li><a href="index.html">User Guide</a> &raquo;</li>
      <li>Using Variables</li>
  <li class="wy-breadcrumbs-aside">
          <!-- Ansible-specific additions for modules etc -->
            
              <a href="https://github.com/ansible/ansible/edit/devel/docs/docsite/rst/user_guide/playbooks_variables.rst?description=%23%23%23%23%23%20SUMMARY%0A%3C!---%20Your%20description%20here%20--%3E%0A%0A%0A%23%23%23%23%23%20ISSUE%20TYPE%0A-%20Docs%20Pull%20Request%0A%0A%2Blabel:%20docsite_pr" class="fa fa-github"> Edit on GitHub</a>
            
  </li>
  </ul>
  <hr/>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
  <script>
    function startsWith(str, needle) {
      return str.slice(0, needle.length) == needle
    }
    function startsWithOneOf(str, needles) {
      return needles.some(function (needle) {
        return startsWith(str, needle);
      });
    }
    var banner = '';
      var extra_banner = '';
    /*use extra_banner for when marketing wants something extra, like a survey or AnsibleFest notice
    var extra_banner =
      '<div id="latest_extra_banner_id" class="admonition important">' +
      '<br>' +
      '<p>' +
        'You\'re invited to AnsibleFest 2021! ' +
      '<p>' +
        'Explore ways to automate, innovate, and accelerate with our free virtual event September 29-30. ' +
      '<pr>' +
        '<a href="https://reg.ansiblefest.redhat.com/flow/redhat/ansible21/regGenAttendee/login?sc_cid=7013a000002pemAAAQ">Register now!</a> ' +
      '</p>' +
      '<br>' +
      '</div>'; */
    // Create a banner if we're not on the official docs site
    if (location.host == "docs.testing.ansible.com") {
      document.write('<div id="testing_banner_id" class="admonition important">' +
                     '<p>This is the testing site for Ansible Documentation. Unless you are reviewing pre-production changes, please visit the <a href="https://docs.ansible.com/ansible/latest/">official documentation website</a>.</p> <p></p>' +
                     '</div>');
    }
    
      // Create a banner
      current_url_path = window.location.pathname;

      var important = false;
      var msg = '<p>';
      if (startsWith(current_url_path, "/ansible-core/")) {
        msg += 'You are reading documentation for Ansible Core, which contains no plugins except for those in ansible.builtin. For documentation of the Ansible package, go to <a href="/ansible/latest">the latest documentation</a>.';
      } else if (startsWithOneOf(current_url_path, ["/ansible/latest/", "/ansible/6/"])) {
        /* temp extra banner to advertise AnsibeFest2021 */
        banner += extra_banner;

        msg += 'You are reading the <b>latest</b> (stable) community version of the Ansible documentation. Red Hat subscribers, select <b>2.9</b> in the version selection to the left for the most recent Red Hat release.';
      } else if (startsWith(current_url_path, "/ansible/2.9/")) {
        msg += 'You are reading the latest Red Hat released version of the Ansible documentation. Community users can use this version, or select <b>latest</b> from the version selector to the left for the most recent community version.';
      } else if (startsWith(current_url_path, "/ansible/devel/")) {
        /* temp extra banner to advertise AnsibleFest2021 */
        banner += extra_banner;

        /* temp banner to advertise survey
        important = true;
        msg += 'Please take our <a href="https://www.surveymonkey.co.uk/r/B9V3CDY">Docs survey</a> before December 31 to help us improve Ansible documentation.';
        */

        msg += 'You are reading the <b>devel</b> version of the Ansible documentation - this version is not guaranteed stable. Use the version selection to the left if you want the <b>latest</b> (stable) released version.';
      } else {
        msg += 'You are reading an older version of the Ansible documentation. Use the version selection to the left if you want the <b>latest</b> (stable) released version.';
      }
      msg += '</p>';

      banner += '<div id="banner_id" class="admonition ';
      banner += important ? 'important' : 'caution';
      banner += '">';
      banner += important ? '<br>' : '';
      banner += msg;
      banner += important ? '<br>' : '';
      banner += '</div>';
      document.write(banner);
    
  </script>


  
           <div itemprop="articleBody">
             
  <section id="using-variables">
<span id="playbooks-variables"></span><h1>Using Variables<a class="headerlink" href="#using-variables" title="Permalink to this headline"></a></h1>
<p>Ansible uses variables to manage differences between systems. With Ansible, you can execute tasks and playbooks on multiple different systems with a single command. To represent the variations among those different systems, you can create variables with standard YAML syntax, including lists and dictionaries. You can define these variables in your playbooks, in your <a class="reference internal" href="intro_inventory.html#intro-inventory"><span class="std std-ref">inventory</span></a>, in re-usable <a class="reference internal" href="playbooks_reuse.html#playbooks-reuse"><span class="std std-ref">files</span></a> or <a class="reference internal" href="playbooks_reuse_roles.html#playbooks-reuse-roles"><span class="std std-ref">roles</span></a>, or at the command line. You can also create variables during a playbook run by registering the return value or values of a task as a new variable.</p>
<p>After you create variables, either by defining them in a file, passing them at the command line, or registering the return value or values of a task as a new variable, you can use those variables in module arguments, in <a class="reference internal" href="playbooks_conditionals.html#playbooks-conditionals"><span class="std std-ref">conditional “when” statements</span></a>, in <a class="reference internal" href="playbooks_templating.html#playbooks-templating"><span class="std std-ref">templates</span></a>, and in <a class="reference internal" href="playbooks_loops.html#playbooks-loops"><span class="std std-ref">loops</span></a>. The <a class="reference external" href="https://github.com/ansible/ansible-examples">ansible-examples github repository</a> contains many examples of using variables in Ansible.</p>
<p>Once you understand the concepts and examples on this page, read about <a class="reference internal" href="playbooks_vars_facts.html#vars-and-facts"><span class="std std-ref">Ansible facts</span></a>, which are variables you retrieve from remote systems.</p>
<div class="contents local topic" id="contents">
<ul class="simple">
<li><p><a class="reference internal" href="#creating-valid-variable-names" id="id17">Creating valid variable names</a></p></li>
<li><p><a class="reference internal" href="#simple-variables" id="id18">Simple variables</a></p>
<ul>
<li><p><a class="reference internal" href="#defining-simple-variables" id="id19">Defining simple variables</a></p></li>
<li><p><a class="reference internal" href="#referencing-simple-variables" id="id20">Referencing simple variables</a></p></li>
</ul>
</li>
<li><p><a class="reference internal" href="#when-to-quote-variables-a-yaml-gotcha" id="id21">When to quote variables (a YAML gotcha)</a></p></li>
<li><p><a class="reference internal" href="#list-variables" id="id22">List variables</a></p>
<ul>
<li><p><a class="reference internal" href="#defining-variables-as-lists" id="id23">Defining variables as lists</a></p></li>
<li><p><a class="reference internal" href="#referencing-list-variables" id="id24">Referencing list variables</a></p></li>
</ul>
</li>
<li><p><a class="reference internal" href="#dictionary-variables" id="id25">Dictionary variables</a></p>
<ul>
<li><p><a class="reference internal" href="#defining-variables-as-key-value-dictionaries" id="id26">Defining variables as key:value dictionaries</a></p></li>
<li><p><a class="reference internal" href="#referencing-key-value-dictionary-variables" id="id27">Referencing key:value dictionary variables</a></p></li>
</ul>
</li>
<li><p><a class="reference internal" href="#registering-variables" id="id28">Registering variables</a></p></li>
<li><p><a class="reference internal" href="#referencing-nested-variables" id="id29">Referencing nested variables</a></p></li>
<li><p><a class="reference internal" href="#transforming-variables-with-jinja2-filters" id="id30">Transforming variables with Jinja2 filters</a></p></li>
<li><p><a class="reference internal" href="#where-to-set-variables" id="id31">Where to set variables</a></p>
<ul>
<li><p><a class="reference internal" href="#defining-variables-in-inventory" id="id32">Defining variables in inventory</a></p></li>
<li><p><a class="reference internal" href="#defining-variables-in-a-play" id="id33">Defining variables in a play</a></p></li>
<li><p><a class="reference internal" href="#defining-variables-in-included-files-and-roles" id="id34">Defining variables in included files and roles</a></p></li>
<li><p><a class="reference internal" href="#defining-variables-at-runtime" id="id35">Defining variables at runtime</a></p>
<ul>
<li><p><a class="reference internal" href="#key-value-format" id="id36">key=value format</a></p></li>
<li><p><a class="reference internal" href="#json-string-format" id="id37">JSON string format</a></p></li>
<li><p><a class="reference internal" href="#vars-from-a-json-or-yaml-file" id="id38">vars from a JSON or YAML file</a></p></li>
</ul>
</li>
</ul>
</li>
<li><p><a class="reference internal" href="#variable-precedence-where-should-i-put-a-variable" id="id39">Variable precedence: Where should I put a variable?</a></p>
<ul>
<li><p><a class="reference internal" href="#understanding-variable-precedence" id="id40">Understanding variable precedence</a></p></li>
<li><p><a class="reference internal" href="#scoping-variables" id="id41">Scoping variables</a></p></li>
<li><p><a class="reference internal" href="#tips-on-where-to-set-variables" id="id42">Tips on where to set variables</a></p></li>
</ul>
</li>
<li><p><a class="reference internal" href="#using-advanced-variable-syntax" id="id43">Using advanced variable syntax</a></p></li>
</ul>
</div>
<section id="creating-valid-variable-names">
<span id="valid-variable-names"></span><h2><a class="toc-backref" href="#id17">Creating valid variable names</a><a class="headerlink" href="#creating-valid-variable-names" title="Permalink to this headline"></a></h2>
<p>Not all strings are valid Ansible variable names. A variable name can only include letters, numbers, and underscores. <a class="reference external" href="https://docs.python.org/3/reference/lexical_analysis.html#keywords">Python keywords</a> or <a class="reference internal" href="../reference_appendices/playbooks_keywords.html#playbook-keywords"><span class="std std-ref">playbook keywords</span></a> are not valid variable names. A variable name cannot begin with a number.</p>
<p>Variable names can begin with an underscore. In many programming languages, variables that begin with an underscore are private. This is not true in Ansible. Variables that begin with an underscore are treated exactly the same as any other variable. Do not rely on this convention for privacy or security.</p>
<p>This table gives examples of valid and invalid variable names:</p>
<table class="documentation-table docutils align-default">
<colgroup>
<col style="width: 24%" />
<col style="width: 76%" />
</colgroup>
<thead>
<tr class="row-odd"><th class="head"><p>Valid variable names</p></th>
<th class="head"><p>Not valid</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">foo</span></code></p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">*foo</span></code>, <a class="reference external" href="https://docs.python.org/3/reference/lexical_analysis.html#keywords">Python keywords</a> such as <code class="docutils literal notranslate"><span class="pre">async</span></code> and <code class="docutils literal notranslate"><span class="pre">lambda</span></code></p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">foo_env</span></code></p></td>
<td><p><a class="reference internal" href="../reference_appendices/playbooks_keywords.html#playbook-keywords"><span class="std std-ref">playbook keywords</span></a> such as <code class="docutils literal notranslate"><span class="pre">environment</span></code></p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">foo_port</span></code></p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">foo-port</span></code>, <code class="docutils literal notranslate"><span class="pre">foo</span> <span class="pre">port</span></code>, <code class="docutils literal notranslate"><span class="pre">foo.port</span></code></p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">foo5</span></code>, <code class="docutils literal notranslate"><span class="pre">_foo</span></code></p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">5foo</span></code>, <code class="docutils literal notranslate"><span class="pre">12</span></code></p></td>
</tr>
</tbody>
</table>
</section>
<section id="simple-variables">
<h2><a class="toc-backref" href="#id18">Simple variables</a><a class="headerlink" href="#simple-variables" title="Permalink to this headline"></a></h2>
<p>Simple variables combine a variable name with a single value. You can use this syntax (and the syntax for lists and dictionaries shown below) in a variety of places. For details about setting variables in inventory, in playbooks, in reusable files, in roles, or at the command line, see <a class="reference internal" href="#setting-variables"><span class="std std-ref">Where to set variables</span></a>.</p>
<section id="defining-simple-variables">
<h3><a class="toc-backref" href="#id19">Defining simple variables</a><a class="headerlink" href="#defining-simple-variables" title="Permalink to this headline"></a></h3>
<p>You can define a simple variable using standard YAML syntax. For example:</p>
<div class="highlight-text notranslate"><div class="highlight"><pre><span></span>remote_install_path: /opt/my_app_config
</pre></div>
</div>
</section>
<section id="referencing-simple-variables">
<h3><a class="toc-backref" href="#id20">Referencing simple variables</a><a class="headerlink" href="#referencing-simple-variables" title="Permalink to this headline"></a></h3>
<p>After you define a variable, use Jinja2 syntax to reference it. Jinja2 variables use double curly braces. For example, the expression <code class="docutils literal notranslate"><span class="pre">My</span> <span class="pre">amp</span> <span class="pre">goes</span> <span class="pre">to</span> <span class="pre">{{</span> <span class="pre">max_amp_value</span> <span class="pre">}}</span></code> demonstrates the most basic form of variable substitution. You can use Jinja2 syntax in playbooks. For example:</p>
<div class="highlight-yaml+jinja notranslate"><div class="highlight"><pre><span></span><span class="nt">ansible.builtin.template</span><span class="p">:</span>
  <span class="nt">src</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">foo.cfg.j2</span>
  <span class="nt">dest</span><span class="p">:</span> <span class="s">&#39;</span><span class="cp">{{</span> <span class="nv">remote_install_path</span> <span class="cp">}}</span><span class="s">/foo.cfg&#39;</span>
</pre></div>
</div>
<p>In this example, the variable defines the location of a file, which can vary from one system to another.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>Ansible allows Jinja2 loops and conditionals in <a class="reference internal" href="playbooks_templating.html#playbooks-templating"><span class="std std-ref">templates</span></a> but not in playbooks. You cannot create a loop of tasks. Ansible playbooks are pure machine-parseable YAML.</p>
</div>
</section>
</section>
<section id="when-to-quote-variables-a-yaml-gotcha">
<span id="yaml-gotchas"></span><h2><a class="toc-backref" href="#id21">When to quote variables (a YAML gotcha)</a><a class="headerlink" href="#when-to-quote-variables-a-yaml-gotcha" title="Permalink to this headline"></a></h2>
<p>If you start a value with <code class="docutils literal notranslate"><span class="pre">{{</span> <span class="pre">foo</span> <span class="pre">}}</span></code>, you must quote the whole expression to create valid YAML syntax. If you do not quote the whole expression, the YAML parser cannot interpret the syntax - it might be a variable or it might be the start of a YAML dictionary. For guidance on writing YAML, see the <a class="reference internal" href="../reference_appendices/YAMLSyntax.html#yaml-syntax"><span class="std std-ref">YAML Syntax</span></a> documentation.</p>
<p>If you use a variable without quotes like this:</p>
<div class="highlight-yaml+jinja notranslate"><div class="highlight"><pre><span></span><span class="p p-Indicator">-</span> <span class="nt">hosts</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">app_servers</span>
  <span class="nt">vars</span><span class="p">:</span>
      <span class="nt">app_path</span><span class="p">:</span> <span class="cp">{{</span> <span class="nv">base_path</span> <span class="cp">}}</span><span class="l l-Scalar l-Scalar-Plain">/22</span>
</pre></div>
</div>
<p>You will see: <code class="docutils literal notranslate"><span class="pre">ERROR!</span> <span class="pre">Syntax</span> <span class="pre">Error</span> <span class="pre">while</span> <span class="pre">loading</span> <span class="pre">YAML.</span></code> If you add quotes, Ansible works correctly:</p>
<div class="highlight-yaml+jinja notranslate"><div class="highlight"><pre><span></span><span class="p p-Indicator">-</span> <span class="nt">hosts</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">app_servers</span>
  <span class="nt">vars</span><span class="p">:</span>
       <span class="nt">app_path</span><span class="p">:</span> <span class="s">&quot;</span><span class="cp">{{</span> <span class="nv">base_path</span> <span class="cp">}}</span><span class="s">/22&quot;</span>
</pre></div>
</div>
</section>
<section id="list-variables">
<span id="id1"></span><h2><a class="toc-backref" href="#id22">List variables</a><a class="headerlink" href="#list-variables" title="Permalink to this headline"></a></h2>
<p>A list variable combines a variable name with multiple values. The multiple values can be stored as an itemized list or in square brackets <code class="docutils literal notranslate"><span class="pre">[]</span></code>, separated with commas.</p>
<section id="defining-variables-as-lists">
<h3><a class="toc-backref" href="#id23">Defining variables as lists</a><a class="headerlink" href="#defining-variables-as-lists" title="Permalink to this headline"></a></h3>
<p>You can define variables with multiple values using YAML lists. For example:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nt">region</span><span class="p">:</span>
  <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">northeast</span>
  <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">southeast</span>
  <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">midwest</span>
</pre></div>
</div>
</section>
<section id="referencing-list-variables">
<h3><a class="toc-backref" href="#id24">Referencing list variables</a><a class="headerlink" href="#referencing-list-variables" title="Permalink to this headline"></a></h3>
<p>When you use variables defined as a list (also called an array), you can use individual, specific fields from that list. The first item in a list is item 0, the second item is item 1. For example:</p>
<div class="highlight-yaml+jinja notranslate"><div class="highlight"><pre><span></span><span class="nt">region</span><span class="p">:</span> <span class="s">&quot;</span><span class="cp">{{</span> <span class="nv">region</span><span class="o">[</span><span class="m">0</span><span class="o">]</span> <span class="cp">}}</span><span class="s">&quot;</span>
</pre></div>
</div>
<p>The value of this expression would be “northeast”.</p>
</section>
</section>
<section id="dictionary-variables">
<span id="id2"></span><h2><a class="toc-backref" href="#id25">Dictionary variables</a><a class="headerlink" href="#dictionary-variables" title="Permalink to this headline"></a></h2>
<p>A dictionary stores the data in key-value pairs. Usually, dictionaries are used to store related data, such as the information contained in an ID or a user profile.</p>
<section id="defining-variables-as-key-value-dictionaries">
<h3><a class="toc-backref" href="#id26">Defining variables as key:value dictionaries</a><a class="headerlink" href="#defining-variables-as-key-value-dictionaries" title="Permalink to this headline"></a></h3>
<p>You can define more complex variables using YAML dictionaries. A YAML dictionary maps keys to values.  For example:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nt">foo</span><span class="p">:</span>
  <span class="nt">field1</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">one</span>
  <span class="nt">field2</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">two</span>
</pre></div>
</div>
</section>
<section id="referencing-key-value-dictionary-variables">
<h3><a class="toc-backref" href="#id27">Referencing key:value dictionary variables</a><a class="headerlink" href="#referencing-key-value-dictionary-variables" title="Permalink to this headline"></a></h3>
<p>When you use variables defined as a key:value dictionary (also called a hash), you can use individual, specific fields from that dictionary using either bracket notation or dot notation:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="l l-Scalar l-Scalar-Plain">foo[&#39;field1&#39;]</span>
<span class="l l-Scalar l-Scalar-Plain">foo.field1</span>
</pre></div>
</div>
<p>Both of these examples reference the same value (“one”). Bracket notation always works. Dot notation can cause problems because some keys collide with attributes and methods of python dictionaries. Use bracket notation if you use keys which start and end with two underscores (which are reserved for special meanings in python) or are any of the known public attributes:</p>
<p><code class="docutils literal notranslate"><span class="pre">add</span></code>, <code class="docutils literal notranslate"><span class="pre">append</span></code>, <code class="docutils literal notranslate"><span class="pre">as_integer_ratio</span></code>, <code class="docutils literal notranslate"><span class="pre">bit_length</span></code>, <code class="docutils literal notranslate"><span class="pre">capitalize</span></code>, <code class="docutils literal notranslate"><span class="pre">center</span></code>, <code class="docutils literal notranslate"><span class="pre">clear</span></code>, <code class="docutils literal notranslate"><span class="pre">conjugate</span></code>, <code class="docutils literal notranslate"><span class="pre">copy</span></code>, <code class="docutils literal notranslate"><span class="pre">count</span></code>, <code class="docutils literal notranslate"><span class="pre">decode</span></code>, <code class="docutils literal notranslate"><span class="pre">denominator</span></code>, <code class="docutils literal notranslate"><span class="pre">difference</span></code>, <code class="docutils literal notranslate"><span class="pre">difference_update</span></code>, <code class="docutils literal notranslate"><span class="pre">discard</span></code>, <code class="docutils literal notranslate"><span class="pre">encode</span></code>, <code class="docutils literal notranslate"><span class="pre">endswith</span></code>, <code class="docutils literal notranslate"><span class="pre">expandtabs</span></code>, <code class="docutils literal notranslate"><span class="pre">extend</span></code>, <code class="docutils literal notranslate"><span class="pre">find</span></code>, <code class="docutils literal notranslate"><span class="pre">format</span></code>, <code class="docutils literal notranslate"><span class="pre">fromhex</span></code>, <code class="docutils literal notranslate"><span class="pre">fromkeys</span></code>, <code class="docutils literal notranslate"><span class="pre">get</span></code>, <code class="docutils literal notranslate"><span class="pre">has_key</span></code>, <code class="docutils literal notranslate"><span class="pre">hex</span></code>, <code class="docutils literal notranslate"><span class="pre">imag</span></code>, <code class="docutils literal notranslate"><span class="pre">index</span></code>, <code class="docutils literal notranslate"><span class="pre">insert</span></code>, <code class="docutils literal notranslate"><span class="pre">intersection</span></code>, <code class="docutils literal notranslate"><span class="pre">intersection_update</span></code>, <code class="docutils literal notranslate"><span class="pre">isalnum</span></code>, <code class="docutils literal notranslate"><span class="pre">isalpha</span></code>, <code class="docutils literal notranslate"><span class="pre">isdecimal</span></code>, <code class="docutils literal notranslate"><span class="pre">isdigit</span></code>, <code class="docutils literal notranslate"><span class="pre">isdisjoint</span></code>, <code class="docutils literal notranslate"><span class="pre">is_integer</span></code>, <code class="docutils literal notranslate"><span class="pre">islower</span></code>, <code class="docutils literal notranslate"><span class="pre">isnumeric</span></code>, <code class="docutils literal notranslate"><span class="pre">isspace</span></code>, <code class="docutils literal notranslate"><span class="pre">issubset</span></code>, <code class="docutils literal notranslate"><span class="pre">issuperset</span></code>, <code class="docutils literal notranslate"><span class="pre">istitle</span></code>, <code class="docutils literal notranslate"><span class="pre">isupper</span></code>, <code class="docutils literal notranslate"><span class="pre">items</span></code>, <code class="docutils literal notranslate"><span class="pre">iteritems</span></code>, <code class="docutils literal notranslate"><span class="pre">iterkeys</span></code>, <code class="docutils literal notranslate"><span class="pre">itervalues</span></code>, <code class="docutils literal notranslate"><span class="pre">join</span></code>, <code class="docutils literal notranslate"><span class="pre">keys</span></code>, <code class="docutils literal notranslate"><span class="pre">ljust</span></code>, <code class="docutils literal notranslate"><span class="pre">lower</span></code>, <code class="docutils literal notranslate"><span class="pre">lstrip</span></code>, <code class="docutils literal notranslate"><span class="pre">numerator</span></code>, <code class="docutils literal notranslate"><span class="pre">partition</span></code>, <code class="docutils literal notranslate"><span class="pre">pop</span></code>, <code class="docutils literal notranslate"><span class="pre">popitem</span></code>, <code class="docutils literal notranslate"><span class="pre">real</span></code>, <code class="docutils literal notranslate"><span class="pre">remove</span></code>, <code class="docutils literal notranslate"><span class="pre">replace</span></code>, <code class="docutils literal notranslate"><span class="pre">reverse</span></code>, <code class="docutils literal notranslate"><span class="pre">rfind</span></code>, <code class="docutils literal notranslate"><span class="pre">rindex</span></code>, <code class="docutils literal notranslate"><span class="pre">rjust</span></code>, <code class="docutils literal notranslate"><span class="pre">rpartition</span></code>, <code class="docutils literal notranslate"><span class="pre">rsplit</span></code>, <code class="docutils literal notranslate"><span class="pre">rstrip</span></code>, <code class="docutils literal notranslate"><span class="pre">setdefault</span></code>, <code class="docutils literal notranslate"><span class="pre">sort</span></code>, <code class="docutils literal notranslate"><span class="pre">split</span></code>, <code class="docutils literal notranslate"><span class="pre">splitlines</span></code>, <code class="docutils literal notranslate"><span class="pre">startswith</span></code>, <code class="docutils literal notranslate"><span class="pre">strip</span></code>, <code class="docutils literal notranslate"><span class="pre">swapcase</span></code>, <code class="docutils literal notranslate"><span class="pre">symmetric_difference</span></code>, <code class="docutils literal notranslate"><span class="pre">symmetric_difference_update</span></code>, <code class="docutils literal notranslate"><span class="pre">title</span></code>, <code class="docutils literal notranslate"><span class="pre">translate</span></code>, <code class="docutils literal notranslate"><span class="pre">union</span></code>, <code class="docutils literal notranslate"><span class="pre">update</span></code>, <code class="docutils literal notranslate"><span class="pre">upper</span></code>, <code class="docutils literal notranslate"><span class="pre">values</span></code>, <code class="docutils literal notranslate"><span class="pre">viewitems</span></code>, <code class="docutils literal notranslate"><span class="pre">viewkeys</span></code>, <code class="docutils literal notranslate"><span class="pre">viewvalues</span></code>, <code class="docutils literal notranslate"><span class="pre">zfill</span></code>.</p>
</section>
</section>
<section id="registering-variables">
<span id="registered-variables"></span><h2><a class="toc-backref" href="#id28">Registering variables</a><a class="headerlink" href="#registering-variables" title="Permalink to this headline"></a></h2>
<p>You can create variables from the output of an Ansible task with the task keyword <code class="docutils literal notranslate"><span class="pre">register</span></code>. You can use registered variables in any later tasks in your play. For example:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="p p-Indicator">-</span> <span class="nt">hosts</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">web_servers</span>

  <span class="nt">tasks</span><span class="p">:</span>

     <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Run a shell command and register its output as a variable</span>
       <span class="nt">ansible.builtin.shell</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">/usr/bin/foo</span>
       <span class="nt">register</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">foo_result</span>
       <span class="nt">ignore_errors</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">true</span>

     <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Run a shell command using output of the previous task</span>
       <span class="nt">ansible.builtin.shell</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">/usr/bin/bar</span>
       <span class="nt">when</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">foo_result.rc == 5</span>
</pre></div>
</div>
<p>For more examples of using registered variables in conditions on later tasks, see <a class="reference internal" href="playbooks_conditionals.html#playbooks-conditionals"><span class="std std-ref">Conditionals</span></a>. Registered variables may be simple variables, list variables, dictionary variables, or complex nested data structures. The documentation for each module includes a <code class="docutils literal notranslate"><span class="pre">RETURN</span></code> section describing the return values for that module. To see the values for a particular task, run your playbook with <code class="docutils literal notranslate"><span class="pre">-v</span></code>.</p>
<p>Registered variables are stored in memory. You cannot cache registered variables for use in future plays. Registered variables are only valid on the host for the rest of the current playbook run.</p>
<p>Registered variables are host-level variables. When you register a variable in a task with a loop, the registered variable contains a value for each item in the loop. The data structure placed in the variable during the loop will contain a <code class="docutils literal notranslate"><span class="pre">results</span></code> attribute, that is a list of all responses from the module. For a more in-depth example of how this works, see the <a class="reference internal" href="playbooks_loops.html#playbooks-loops"><span class="std std-ref">Loops</span></a> section on using register with a loop.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>If a task fails or is skipped, Ansible still registers a variable with a failure or skipped status, unless the task is skipped based on tags. See <a class="reference internal" href="playbooks_tags.html#tags"><span class="std std-ref">Tags</span></a> for information on adding and using tags.</p>
</div>
</section>
<section id="referencing-nested-variables">
<span id="accessing-complex-variable-data"></span><h2><a class="toc-backref" href="#id29">Referencing nested variables</a><a class="headerlink" href="#referencing-nested-variables" title="Permalink to this headline"></a></h2>
<p>Many registered variables (and <a class="reference internal" href="playbooks_vars_facts.html#vars-and-facts"><span class="std std-ref">facts</span></a>) are nested YAML or JSON data structures. You cannot access values from these nested data structures with the simple <code class="docutils literal notranslate"><span class="pre">{{</span> <span class="pre">foo</span> <span class="pre">}}</span></code> syntax. You must use either bracket notation or dot notation. For example, to reference an IP address from your facts using the bracket notation:</p>
<div class="highlight-yaml+jinja notranslate"><div class="highlight"><pre><span></span><span class="cp">{{</span> <span class="nv">ansible_facts</span><span class="o">[</span><span class="s2">&quot;eth0&quot;</span><span class="o">][</span><span class="s2">&quot;ipv4&quot;</span><span class="o">][</span><span class="s2">&quot;address&quot;</span><span class="o">]</span> <span class="cp">}}</span>
</pre></div>
</div>
<p>To reference an IP address from your facts using the dot notation:</p>
<div class="highlight-yaml+jinja notranslate"><div class="highlight"><pre><span></span><span class="cp">{{</span> <span class="nv">ansible_facts.eth0.ipv4.address</span> <span class="cp">}}</span>
</pre></div>
</div>
</section>
<section id="transforming-variables-with-jinja2-filters">
<span id="jinja2-filters"></span><span id="about-jinja2"></span><h2><a class="toc-backref" href="#id30">Transforming variables with Jinja2 filters</a><a class="headerlink" href="#transforming-variables-with-jinja2-filters" title="Permalink to this headline"></a></h2>
<p>Jinja2 filters let you transform the value of a variable within a template expression. For example, the <code class="docutils literal notranslate"><span class="pre">capitalize</span></code> filter capitalizes any value passed to it; the <code class="docutils literal notranslate"><span class="pre">to_yaml</span></code> and <code class="docutils literal notranslate"><span class="pre">to_json</span></code> filters change the format of your variable values. Jinja2 includes many <a class="reference external" href="https://jinja.palletsprojects.com/templates/#builtin-filters">built-in filters</a> and Ansible supplies many more filters. To find more examples of filters, see <a class="reference internal" href="playbooks_filters.html#playbooks-filters"><span class="std std-ref">Using filters to manipulate data</span></a>.</p>
</section>
<section id="where-to-set-variables">
<span id="setting-variables"></span><h2><a class="toc-backref" href="#id31">Where to set variables</a><a class="headerlink" href="#where-to-set-variables" title="Permalink to this headline"></a></h2>
<p>You can define variables in a variety of places, such as in inventory, in playbooks, in reusable files, in roles, and at the command line. Ansible loads every possible variable it finds, then chooses the variable to apply based on <a class="reference internal" href="#ansible-variable-precedence"><span class="std std-ref">variable precedence rules</span></a>.</p>
<section id="defining-variables-in-inventory">
<span id="define-variables-in-inventory"></span><h3><a class="toc-backref" href="#id32">Defining variables in inventory</a><a class="headerlink" href="#defining-variables-in-inventory" title="Permalink to this headline"></a></h3>
<p>You can define different variables for each individual host, or set shared variables for a group of hosts in your inventory. For example, if all machines in the <code class="docutils literal notranslate"><span class="pre">[Boston]</span></code> group use ‘boston.ntp.example.com’ as an NTP server, you can set a group variable. The <a class="reference internal" href="intro_inventory.html#intro-inventory"><span class="std std-ref">How to build your inventory</span></a> page has details on setting <a class="reference internal" href="intro_inventory.html#host-variables"><span class="std std-ref">host variables</span></a> and <a class="reference internal" href="intro_inventory.html#group-variables"><span class="std std-ref">group variables</span></a> in inventory.</p>
</section>
<section id="defining-variables-in-a-play">
<span id="playbook-variables"></span><h3><a class="toc-backref" href="#id33">Defining variables in a play</a><a class="headerlink" href="#defining-variables-in-a-play" title="Permalink to this headline"></a></h3>
<p>You can define variables directly in a playbook play:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="p p-Indicator">-</span> <span class="nt">hosts</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">webservers</span>
  <span class="nt">vars</span><span class="p">:</span>
    <span class="nt">http_port</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">80</span>
</pre></div>
</div>
<p>When you define variables in a play, they are only visible to tasks executed in that play.</p>
</section>
<section id="defining-variables-in-included-files-and-roles">
<span id="variable-file-separation-details"></span><span id="included-variables"></span><h3><a class="toc-backref" href="#id34">Defining variables in included files and roles</a><a class="headerlink" href="#defining-variables-in-included-files-and-roles" title="Permalink to this headline"></a></h3>
<p>You can define variables in reusable variables files and/or in reusable roles. When you define variables in reusable variable files, the sensitive variables are separated from playbooks. This separation enables you to store your playbooks in a source control software and even share the playbooks, without the risk of exposing passwords or other sensitive and personal data. For information about creating reusable files and roles, see <a class="reference internal" href="playbooks_reuse.html#playbooks-reuse"><span class="std std-ref">Re-using Ansible artifacts</span></a>.</p>
<p>This example shows how you can include variables defined in an external file:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nn">---</span>

<span class="p p-Indicator">-</span> <span class="nt">hosts</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">all</span>
  <span class="nt">remote_user</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">root</span>
  <span class="nt">vars</span><span class="p">:</span>
    <span class="nt">favcolor</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">blue</span>
  <span class="nt">vars_files</span><span class="p">:</span>
    <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">/vars/external_vars.yml</span>

  <span class="nt">tasks</span><span class="p">:</span>

  <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">This is just a placeholder</span>
    <span class="nt">ansible.builtin.command</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">/bin/echo foo</span>
</pre></div>
</div>
<p>The contents of each variables file is a simple YAML dictionary. For example:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nn">---</span>
<span class="c1"># in the above example, this would be vars/external_vars.yml</span>
<span class="nt">somevar</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">somevalue</span>
<span class="nt">password</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">magic</span>
</pre></div>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>You can keep per-host and per-group variables in similar files. To learn about organizing your variables, see <a class="reference internal" href="intro_inventory.html#splitting-out-vars"><span class="std std-ref">Organizing host and group variables</span></a>.</p>
</div>
</section>
<section id="defining-variables-at-runtime">
<span id="passing-variables-on-the-command-line"></span><h3><a class="toc-backref" href="#id35">Defining variables at runtime</a><a class="headerlink" href="#defining-variables-at-runtime" title="Permalink to this headline"></a></h3>
<p>You can define variables when you run your playbook by passing variables at the command line using the <code class="docutils literal notranslate"><span class="pre">--extra-vars</span></code> (or <code class="docutils literal notranslate"><span class="pre">-e</span></code>) argument. You can also request user input with a <code class="docutils literal notranslate"><span class="pre">vars_prompt</span></code> (see <a class="reference internal" href="playbooks_prompts.html#playbooks-prompts"><span class="std std-ref">Interactive input: prompts</span></a>). When you pass variables at the command line, use a single quoted string, that contains one or more variables, in one of the formats below.</p>
<section id="key-value-format">
<h4><a class="toc-backref" href="#id36">key=value format</a><a class="headerlink" href="#key-value-format" title="Permalink to this headline"></a></h4>
<p>Values passed in using the <code class="docutils literal notranslate"><span class="pre">key=value</span></code> syntax are interpreted as strings. Use the JSON format if you need to pass non-string values such as Booleans, integers, floats, lists, and so on.</p>
<div class="highlight-text notranslate"><div class="highlight"><pre><span></span>ansible-playbook release.yml --extra-vars &quot;version=1.23.45 other_variable=foo&quot;
</pre></div>
</div>
</section>
<section id="json-string-format">
<h4><a class="toc-backref" href="#id37">JSON string format</a><a class="headerlink" href="#json-string-format" title="Permalink to this headline"></a></h4>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span>ansible-playbook release.yml --extra-vars <span class="s1">&#39;{&quot;version&quot;:&quot;1.23.45&quot;,&quot;other_variable&quot;:&quot;foo&quot;}&#39;</span>
ansible-playbook arcade.yml --extra-vars <span class="s1">&#39;{&quot;pacman&quot;:&quot;mrs&quot;,&quot;ghosts&quot;:[&quot;inky&quot;,&quot;pinky&quot;,&quot;clyde&quot;,&quot;sue&quot;]}&#39;</span>
</pre></div>
</div>
<p>When passing variables with <code class="docutils literal notranslate"><span class="pre">--extra-vars</span></code>, you must escape quotes and other special characters appropriately for both your markup (for example, JSON), and for your shell:</p>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span>ansible-playbook arcade.yml --extra-vars <span class="s2">&quot;{\&quot;name\&quot;:\&quot;Conan O\&#39;Brien\&quot;}&quot;</span>
ansible-playbook arcade.yml --extra-vars <span class="s1">&#39;{&quot;name&quot;:&quot;Conan O&#39;</span><span class="se">\\\&#39;</span><span class="s1">&#39;Brien&quot;}&#39;</span>
ansible-playbook script.yml --extra-vars <span class="s2">&quot;{\&quot;dialog\&quot;:\&quot;He said \\\&quot;I just can\&#39;t get enough of those single and double-quotes&quot;</span><span class="se">\!</span><span class="s2">&quot;\\\&quot;\&quot;}&quot;</span>
</pre></div>
</div>
<p>If you have a lot of special characters, use a JSON or YAML file containing the variable definitions.</p>
</section>
<section id="vars-from-a-json-or-yaml-file">
<h4><a class="toc-backref" href="#id38">vars from a JSON or YAML file</a><a class="headerlink" href="#vars-from-a-json-or-yaml-file" title="Permalink to this headline"></a></h4>
<div class="highlight-text notranslate"><div class="highlight"><pre><span></span>ansible-playbook release.yml --extra-vars &quot;@some_file.json&quot;
</pre></div>
</div>
</section>
</section>
</section>
<section id="variable-precedence-where-should-i-put-a-variable">
<span id="ansible-variable-precedence"></span><h2><a class="toc-backref" href="#id39">Variable precedence: Where should I put a variable?</a><a class="headerlink" href="#variable-precedence-where-should-i-put-a-variable" title="Permalink to this headline"></a></h2>
<p>You can set multiple variables with the same name in many different places. When you do this, Ansible loads every possible variable it finds, then chooses the variable to apply based on variable precedence. In other words, the different variables will override each other in a certain order.</p>
<p>Teams and projects that agree on guidelines for defining variables (where to define certain types of variables) usually avoid variable precedence concerns. We suggest that you define each variable in one place: figure out where to define a variable, and keep it simple. For examples, see <a class="reference internal" href="#variable-examples"><span class="std std-ref">Tips on where to set variables</span></a>.</p>
<p>Some behavioral parameters that you can set in variables you can also set in Ansible configuration, as command-line options, and using playbook keywords. For example, you can define the user Ansible uses to connect to remote devices as a variable with <code class="docutils literal notranslate"><span class="pre">ansible_user</span></code>, in a configuration file with <code class="docutils literal notranslate"><span class="pre">DEFAULT_REMOTE_USER</span></code>, as a command-line option with <code class="docutils literal notranslate"><span class="pre">-u</span></code>, and with the playbook keyword <code class="docutils literal notranslate"><span class="pre">remote_user</span></code>. If you define the same parameter in a variable and by another method, the variable overrides the other setting. This approach allows host-specific settings to override more general settings. For examples and more details on the precedence of these various settings, see <a class="reference internal" href="../reference_appendices/general_precedence.html#general-precedence-rules"><span class="std std-ref">Controlling how Ansible behaves: precedence rules</span></a>.</p>
<section id="understanding-variable-precedence">
<h3><a class="toc-backref" href="#id40">Understanding variable precedence</a><a class="headerlink" href="#understanding-variable-precedence" title="Permalink to this headline"></a></h3>
<p>Ansible does apply variable precedence, and you might have a use for it. Here is the order of precedence from least to greatest (the last listed variables override all other variables):</p>
<blockquote>
<div><ol class="arabic simple">
<li><p>command line values (for example, <code class="docutils literal notranslate"><span class="pre">-u</span> <span class="pre">my_user</span></code>, these are not variables)</p></li>
<li><p>role defaults (defined in role/defaults/main.yml) <a class="footnote-reference brackets" href="#id13" id="id3">1</a></p></li>
<li><p>inventory file or script group vars <a class="footnote-reference brackets" href="#id14" id="id4">2</a></p></li>
<li><p>inventory group_vars/all <a class="footnote-reference brackets" href="#id15" id="id5">3</a></p></li>
<li><p>playbook group_vars/all <a class="footnote-reference brackets" href="#id15" id="id6">3</a></p></li>
<li><p>inventory group_vars/* <a class="footnote-reference brackets" href="#id15" id="id7">3</a></p></li>
<li><p>playbook group_vars/* <a class="footnote-reference brackets" href="#id15" id="id8">3</a></p></li>
<li><p>inventory file or script host vars <a class="footnote-reference brackets" href="#id14" id="id9">2</a></p></li>
<li><p>inventory host_vars/* <a class="footnote-reference brackets" href="#id15" id="id10">3</a></p></li>
<li><p>playbook host_vars/* <a class="footnote-reference brackets" href="#id15" id="id11">3</a></p></li>
<li><p>host facts / cached set_facts <a class="footnote-reference brackets" href="#id16" id="id12">4</a></p></li>
<li><p>play vars</p></li>
<li><p>play vars_prompt</p></li>
<li><p>play vars_files</p></li>
<li><p>role vars (defined in role/vars/main.yml)</p></li>
<li><p>block vars (only for tasks in block)</p></li>
<li><p>task vars (only for the task)</p></li>
<li><p>include_vars</p></li>
<li><p>set_facts / registered vars</p></li>
<li><p>role (and include_role) params</p></li>
<li><p>include params</p></li>
<li><p>extra vars (for example, <code class="docutils literal notranslate"><span class="pre">-e</span> <span class="pre">&quot;user=my_user&quot;</span></code>)(always win precedence)</p></li>
</ol>
</div></blockquote>
<p>In general, Ansible gives precedence to variables that were defined more recently, more actively, and with more explicit scope. Variables in the defaults folder inside a role are easily overridden. Anything in the vars directory of the role overrides previous versions of that variable in the namespace. Host and/or inventory variables override role defaults, but explicit includes such as the vars directory or an <code class="docutils literal notranslate"><span class="pre">include_vars</span></code> task override inventory variables.</p>
<p>Ansible merges different variables set in inventory so that more specific settings override more generic settings. For example, <code class="docutils literal notranslate"><span class="pre">ansible_ssh_user</span></code> specified as a group_var is overridden by <code class="docutils literal notranslate"><span class="pre">ansible_user</span></code> specified as a host_var. For details about the precedence of variables set in inventory, see <a class="reference internal" href="intro_inventory.html#how-we-merge"><span class="std std-ref">How variables are merged</span></a>.</p>
<p class="rubric">Footnotes</p>
<dl class="footnote brackets">
<dt class="label" id="id13"><span class="brackets"><a class="fn-backref" href="#id3">1</a></span></dt>
<dd><p>Tasks in each role see their own role’s defaults. Tasks defined outside of a role see the last role’s defaults.</p>
</dd>
<dt class="label" id="id14"><span class="brackets">2</span><span class="fn-backref">(<a href="#id4">1</a>,<a href="#id9">2</a>)</span></dt>
<dd><p>Variables defined in inventory file or provided by dynamic inventory.</p>
</dd>
<dt class="label" id="id15"><span class="brackets">3</span><span class="fn-backref">(<a href="#id5">1</a>,<a href="#id6">2</a>,<a href="#id7">3</a>,<a href="#id8">4</a>,<a href="#id10">5</a>,<a href="#id11">6</a>)</span></dt>
<dd><p>Includes vars added by ‘vars plugins’ as well as host_vars and group_vars which are added by the default vars plugin shipped with Ansible.</p>
</dd>
<dt class="label" id="id16"><span class="brackets"><a class="fn-backref" href="#id12">4</a></span></dt>
<dd><p>When created with set_facts’s cacheable option, variables have the high precedence in the play,
but are the same as a host facts precedence when they come from the cache.</p>
</dd>
</dl>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>Within any section, redefining a var overrides the previous instance.
If multiple groups have the same variable, the last one loaded wins.
If you define a variable twice in a play’s <code class="docutils literal notranslate"><span class="pre">vars:</span></code> section, the second one wins.</p>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>The previous describes the default config <code class="docutils literal notranslate"><span class="pre">hash_behaviour=replace</span></code>, switch to <code class="docutils literal notranslate"><span class="pre">merge</span></code> to only partially overwrite.</p>
</div>
</section>
<section id="scoping-variables">
<span id="variable-scopes"></span><h3><a class="toc-backref" href="#id41">Scoping variables</a><a class="headerlink" href="#scoping-variables" title="Permalink to this headline"></a></h3>
<p>You can decide where to set a variable based on the scope you want that value to have. Ansible has three main scopes:</p>
<blockquote>
<div><ul class="simple">
<li><p>Global: this is set by config, environment variables and the command line</p></li>
<li><p>Play: each play and contained structures, vars entries (vars; vars_files; vars_prompt), role defaults and vars.</p></li>
<li><p>Host: variables directly associated to a host, like inventory, include_vars, facts or registered task outputs</p></li>
</ul>
</div></blockquote>
<p>Inside a template, you automatically have access to all variables that are in scope for a host, plus any registered variables, facts, and magic variables.</p>
</section>
<section id="tips-on-where-to-set-variables">
<span id="variable-examples"></span><h3><a class="toc-backref" href="#id42">Tips on where to set variables</a><a class="headerlink" href="#tips-on-where-to-set-variables" title="Permalink to this headline"></a></h3>
<p>You should choose where to define a variable based on the kind of control you might want over values.</p>
<p>Set variables in inventory that deal with geography or behavior. Since groups are frequently the entity that maps roles onto hosts, you can often set variables on the group instead of defining them on a role. Remember: child groups override parent groups, and host variables override group variables. See <a class="reference internal" href="#define-variables-in-inventory"><span class="std std-ref">Defining variables in inventory</span></a> for details on setting host and group variables.</p>
<p>Set common defaults in a <code class="docutils literal notranslate"><span class="pre">group_vars/all</span></code> file. See <a class="reference internal" href="intro_inventory.html#splitting-out-vars"><span class="std std-ref">Organizing host and group variables</span></a> for details on how to organize host and group variables in your inventory. Group variables are generally placed alongside your inventory file, but they can also be returned by dynamic inventory (see <a class="reference internal" href="intro_dynamic_inventory.html#intro-dynamic-inventory"><span class="std std-ref">Working with dynamic inventory</span></a>) or defined in AWX or on <a class="reference internal" href="../reference_appendices/tower.html#ansible-platform"><span class="std std-ref">Red Hat Ansible Automation Platform</span></a> from the UI or API:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nn">---</span>
<span class="c1"># file: /etc/ansible/group_vars/all</span>
<span class="c1"># this is the site wide default</span>
<span class="nt">ntp_server</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">default-time.example.com</span>
</pre></div>
</div>
<p>Set location-specific variables in <code class="docutils literal notranslate"><span class="pre">group_vars/my_location</span></code> files. All groups are children of the <code class="docutils literal notranslate"><span class="pre">all</span></code> group, so variables set here override those set in <code class="docutils literal notranslate"><span class="pre">group_vars/all</span></code>:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nn">---</span>
<span class="c1"># file: /etc/ansible/group_vars/boston</span>
<span class="nt">ntp_server</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">boston-time.example.com</span>
</pre></div>
</div>
<p>If one host used a different NTP server, you could set that in a host_vars file, which would override the group variable:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nn">---</span>
<span class="c1"># file: /etc/ansible/host_vars/xyz.boston.example.com</span>
<span class="nt">ntp_server</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">override.example.com</span>
</pre></div>
</div>
<p>Set defaults in roles to avoid undefined-variable errors. If you share your roles, other users can rely on the reasonable defaults you added in the <code class="docutils literal notranslate"><span class="pre">roles/x/defaults/main.yml</span></code> file, or they can easily override those values in inventory or at the command line. See <a class="reference internal" href="playbooks_reuse_roles.html#playbooks-reuse-roles"><span class="std std-ref">Roles</span></a> for more info. For example:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nn">---</span>
<span class="c1"># file: roles/x/defaults/main.yml</span>
<span class="c1"># if no other value is supplied in inventory or as a parameter, this value will be used</span>
<span class="nt">http_port</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">80</span>
</pre></div>
</div>
<p>Set variables in roles to ensure a value is used in that role, and is not overridden by inventory variables. If you are not sharing your role with others, you can define app-specific behaviors like ports this way, in <code class="docutils literal notranslate"><span class="pre">roles/x/vars/main.yml</span></code>. If you are sharing roles with others, putting variables here makes them harder to override, although they still can by passing a parameter to the role or setting a variable with <code class="docutils literal notranslate"><span class="pre">-e</span></code>:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nn">---</span>
<span class="c1"># file: roles/x/vars/main.yml</span>
<span class="c1"># this will absolutely be used in this role</span>
<span class="nt">http_port</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">80</span>
</pre></div>
</div>
<p>Pass variables as parameters when you call roles for maximum clarity, flexibility, and visibility. This approach overrides any defaults that exist for a role. For example:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nt">roles</span><span class="p">:</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">apache</span>
     <span class="nt">vars</span><span class="p">:</span>
        <span class="nt">http_port</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">8080</span>
</pre></div>
</div>
<p>When you read this playbook it is clear that you have chosen to set a variable or override a default. You can also pass multiple values, which allows you to run the same role multiple times. See <a class="reference internal" href="playbooks_reuse_roles.html#run-role-twice"><span class="std std-ref">Running a role multiple times in one play</span></a> for more details. For example:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nt">roles</span><span class="p">:</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">app_user</span>
     <span class="nt">vars</span><span class="p">:</span>
        <span class="nt">myname</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Ian</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">app_user</span>
     <span class="nt">vars</span><span class="p">:</span>
       <span class="nt">myname</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Terry</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">app_user</span>
     <span class="nt">vars</span><span class="p">:</span>
       <span class="nt">myname</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Graham</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">app_user</span>
     <span class="nt">vars</span><span class="p">:</span>
       <span class="nt">myname</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">John</span>
</pre></div>
</div>
<p>Variables set in one role are available to later roles. You can set variables in a <code class="docutils literal notranslate"><span class="pre">roles/common_settings/vars/main.yml</span></code> file and use them in other roles and elsewhere in your playbook:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nt">roles</span><span class="p">:</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">common_settings</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">something</span>
     <span class="nt">vars</span><span class="p">:</span>
       <span class="nt">foo</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">12</span>
   <span class="p p-Indicator">-</span> <span class="nt">role</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">something_else</span>
</pre></div>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>There are some protections in place to avoid the need to namespace variables.
In this example, variables defined in ‘common_settings’ are available to ‘something’ and ‘something_else’ tasks, but tasks in ‘something’ have foo set at 12, even if ‘common_settings’ sets foo to 20.</p>
</div>
<p>Instead of worrying about variable precedence, we encourage you to think about how easily or how often you want to override a variable when deciding where to set it. If you are not sure what other variables are defined, and you need a particular value, use <code class="docutils literal notranslate"><span class="pre">--extra-vars</span></code> (<code class="docutils literal notranslate"><span class="pre">-e</span></code>) to override all other variables.</p>
</section>
</section>
<section id="using-advanced-variable-syntax">
<h2><a class="toc-backref" href="#id43">Using advanced variable syntax</a><a class="headerlink" href="#using-advanced-variable-syntax" title="Permalink to this headline"></a></h2>
<p>For information about advanced YAML syntax used to declare variables and have more control over the data placed in YAML files used by Ansible, see <a class="reference internal" href="playbooks_advanced_syntax.html#playbooks-advanced-syntax"><span class="std std-ref">Advanced Syntax</span></a>.</p>
<div class="admonition seealso">
<p class="admonition-title">See also</p>
<dl class="simple">
<dt><a class="reference internal" href="playbooks_intro.html#about-playbooks"><span class="std std-ref">Intro to playbooks</span></a></dt><dd><p>An introduction to playbooks</p>
</dd>
<dt><a class="reference internal" href="playbooks_conditionals.html#playbooks-conditionals"><span class="std std-ref">Conditionals</span></a></dt><dd><p>Conditional statements in playbooks</p>
</dd>
<dt><a class="reference internal" href="playbooks_filters.html#playbooks-filters"><span class="std std-ref">Using filters to manipulate data</span></a></dt><dd><p>Jinja2 filters and their uses</p>
</dd>
<dt><a class="reference internal" href="playbooks_loops.html#playbooks-loops"><span class="std std-ref">Loops</span></a></dt><dd><p>Looping in playbooks</p>
</dd>
<dt><a class="reference internal" href="playbooks_reuse_roles.html#playbooks-reuse-roles"><span class="std std-ref">Roles</span></a></dt><dd><p>Playbook organization by roles</p>
</dd>
<dt><a class="reference internal" href="playbooks_best_practices.html#playbooks-best-practices"><span class="std std-ref">Tips and tricks</span></a></dt><dd><p>Tips and tricks for playbooks</p>
</dd>
<dt><a class="reference internal" href="../reference_appendices/special_variables.html#special-variables"><span class="std std-ref">Special Variables</span></a></dt><dd><p>List of special variables</p>
</dd>
<dt><a class="reference external" href="https://groups.google.com/group/ansible-devel">User Mailing List</a></dt><dd><p>Have a question?  Stop by the google group!</p>
</dd>
<dt><a class="reference internal" href="../community/communication.html#communication-irc"><span class="std std-ref">Real-time chat</span></a></dt><dd><p>How to join Ansible chat channels</p>
</dd>
</dl>
</div>
</section>
</section>


           </div>
          </div>
          

<footer><div class="rst-footer-buttons" role="navigation" aria-label="Footer">
        <a href="../cli/ansible-vault.html" class="btn btn-neutral float-left" title="ansible-vault" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> Previous</a>
        <a href="playbooks_vars_facts.html" class="btn btn-neutral float-right" title="Discovering variables: facts and magic variables" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr/>

  <div role="contentinfo">
    <p>&#169; Copyright Ansible project contributors.
      <span class="lastupdated">Last updated on Jun 27, 2022.
      </span></p>
  </div>

  
   

</footer>
        </div>
      </div>
    </section>
  </div>
  <script>
      jQuery(function () {
          SphinxRtdTheme.Navigation.enable(true);
      });
  </script><!-- extra footer elements for Ansible beyond RTD Sphinx Theme -->
<!-- begin analytics -->
<script>
var _hsq = _hsq || [];
_hsq.push(["setContentType", "standard-page"]);
      (function(d,s,i,r) {
      if (d.getElementById(i)){return;}
      var n = d.createElement(s),e = document.getElementsByTagName(s)[0];
      n.id=i;n.src = 'https://js.hs-analytics.net/analytics/'+(Math.ceil(new Date()/r)*r)+'/330046.js';
      e.parentNode.insertBefore(n, e);
      })(document, "script", "hs-analytics",300000);
</script>
<!-- end analytics -->
<script>
if (("undefined" !== typeof _satellite) && ("function" === typeof _satellite.pageBottom)) {
  _satellite.pageBottom();
}
</script>

</body>
</html>