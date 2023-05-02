

<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" > <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en" > <!--<![endif]-->
<head>
  <meta charset="utf-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>community.general.docker_container – manage docker containers &mdash; Ansible Documentation</title>
  

  
  
  
  
    <link rel="canonical" href="https://docs.ansible.com/ansible/latest/collections/community/general/docker_container_module.html"/>
  

  
  <script type="text/javascript" src="../../../_static/js/modernizr.min.js"></script>
  
    
      <script type="text/javascript" id="documentation_options" data-url_root="../../../" src="../../../_static/documentation_options.js"></script>
        <script type="text/javascript" src="../../../_static/jquery.js"></script>
        <script type="text/javascript" src="../../../_static/underscore.js"></script>
        <script type="text/javascript" src="../../../_static/doctools.js"></script>
        <script type="text/javascript" src="../../../_static/language_data.js"></script>
    
    <script type="text/javascript" src="../../../_static/js/theme.js"></script>

    

  
  <link href='https://fonts.googleapis.com/css?family=Lato:400,700|Roboto+Slab:400,700|Inconsolata:400,700' rel='stylesheet' type='text/css'>
  <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>

  
  <link rel="stylesheet" href="../../../_static/css/theme.css" type="text/css" />
  <link rel="stylesheet" href="../../../_static/ansible.css" type="text/css" />
  <link rel="stylesheet" href="../../../_static/pygments.css" type="text/css" />
  <link rel="stylesheet" href="../../../_static/ansible.css" type="text/css" />
    <link rel="index" title="Index" href="../../../genindex.html" />
    <link rel="search" title="Search" href="../../../search.html" /> <!---- extra head elements for Ansible beyond RTD Sphinx Theme --->
<script type="text/javascript" src="//www.redhat.com/dtm.js"></script>
<!-- <meta class="swiftype" name="published_at" data-type="date" content="2017-12-13" /> -->
<meta class="swiftype" name="version" data-type="string" content="2.10">

<!-- Google Tag Manager Data Layer -->
<script>
 dataLayer = [];
</script>
<!-- End Google Tag Manager Data Layer -->

<script src="//cdnjs.cloudflare.com/ajax/libs/modernizr/2.6.2/modernizr.min.js"></script> 
</head>

<body class="wy-body-for-nav">
   <!---- extra body elements for Ansible beyond RTD Sphinx Theme --->
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-PSB293" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start': new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0], j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f); })(window,document,'script','dataLayer','GTM-PSB293');</script>
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
    src="../../../_static/images/logo_invert.png"
    alt="Ansible Logo">
  <div class="DocSiteNav-title">
    Documentation
  </div>
</a> 
  <div class="wy-grid-for-nav">
    
    <nav data-toggle="wy-nav-shift" class="wy-nav-side">
      <div class="wy-side-scroll">
        <div class="wy-side-nav-search" >
          

          
            <a href="../../../index.html" class="icon icon-home"> Ansible
          

          
          </a>

          
            
            
              <div class="version">
                2.10
              </div>
            
          

          <!--- Based on https://github.com/rtfd/sphinx_rtd_theme/pull/438/files -->

<div class="version">
  
    <div class="version-dropdown">
      <select class="version-list" id="version-list" onchange="javascript:location.href = this.value;">
        <script> x = document.getElementById("version-list"); </script>
        
          <script>
            current_url = window.location.href;
            option = document.createElement("option");
            option.text = "latest";
            if ( "latest" == "2.10" ) {
              option.selected = true;
            }
            if (current_url.search("2.10") > -1) {
              option.value = current_url.replace("2.10","latest");
            } else {
              option.value = current_url.replace("latest","latest");
            }
            x.add(option);
          </script>
        
          <script>
            current_url = window.location.href;
            option = document.createElement("option");
            option.text = "2.9";
            if ( "2.9" == "2.10" ) {
              option.selected = true;
            }
            if (current_url.search("2.10") > -1) {
              option.value = current_url.replace("2.10","2.9");
            } else {
              option.value = current_url.replace("latest","2.9");
            }
            x.add(option);
          </script>
        
          <script>
            current_url = window.location.href;
            option = document.createElement("option");
            option.text = "2.9_ja";
            if ( "2.9_ja" == "2.10" ) {
              option.selected = true;
            }
            if (current_url.search("2.10") > -1) {
              option.value = current_url.replace("2.10","2.9_ja");
            } else {
              option.value = current_url.replace("latest","2.9_ja");
            }
            x.add(option);
          </script>
        
          <script>
            current_url = window.location.href;
            option = document.createElement("option");
            option.text = "2.8";
            if ( "2.8" == "2.10" ) {
              option.selected = true;
            }
            if (current_url.search("2.10") > -1) {
              option.value = current_url.replace("2.10","2.8");
            } else {
              option.value = current_url.replace("latest","2.8");
            }
            x.add(option);
          </script>
        
          <script>
            current_url = window.location.href;
            option = document.createElement("option");
            option.text = "devel";
            if ( "devel" == "2.10" ) {
              option.selected = true;
            }
            if (current_url.search("2.10") > -1) {
              option.value = current_url.replace("2.10","devel");
            } else {
              option.value = current_url.replace("latest","devel");
            }
            x.add(option);
          </script>
        
      </select>
    </div>
  
</div>
          
<div role="search">
<!--  <form id="rtd-search-form" class="wy-form" action="../../../search.html" -->
  <form id="rtd-search-form" class="wy-form"  method="get">
    <input type="text" class="st-default-search-input" name="q" placeholder="Search docs" />
    <input type="hidden" name="check_keywords" value="yes" />
    <input type="hidden" name="area" value="default" />
  </form>
</div>

          
        </div>

        
        <div class="wy-menu wy-menu-vertical" data-spy="affix" role="navigation" aria-label="main navigation">
          
            
            
              
            
            
              <p class="caption"><span class="caption-text">Installation, Upgrade &amp; Configuration</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../installation_guide/index.html">Installation Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../porting_guides/porting_guides.html">Ansible Porting Guides</a></li>
</ul>
<p class="caption"><span class="caption-text">Using Ansible</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../user_guide/index.html">User Guide</a></li>
</ul>
<p class="caption"><span class="caption-text">Contributing to Ansible</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../community/index.html">Ansible Community Guide</a></li>
</ul>
<p class="caption"><span class="caption-text">Extending Ansible</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../dev_guide/index.html">Developer Guide</a></li>
</ul>
<p class="caption"><span class="caption-text">Common Ansible Scenarios</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../scenario_guides/cloud_guides.html">Public Cloud Guides</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../scenario_guides/network_guides.html">Network Technology Guides</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../scenario_guides/virt_guides.html">Virtualization and Containerization Guides</a></li>
</ul>
<p class="caption"><span class="caption-text">Network Automation</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../network/getting_started/index.html">Network Getting Started</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../network/user_guide/index.html">Network Advanced Topics</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../network/dev_guide/index.html">Network Developer Guide</a></li>
</ul>
<p class="caption"><span class="caption-text">Ansible Galaxy</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../galaxy/user_guide.html">Galaxy User Guide</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../galaxy/dev_guide.html">Galaxy Developer Guide</a></li>
</ul>
<p class="caption"><span class="caption-text">Reference &amp; Appendices</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../index.html">Collection Index</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/playbooks_keywords.html">Playbook Keywords</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/common_return_values.html">Return Values</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/config.html">Ansible Configuration Settings</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/general_precedence.html">Controlling how Ansible behaves: precedence rules</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/YAMLSyntax.html">YAML Syntax</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/python_3_support.html">Python 3 Support</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/interpreter_discovery.html">Interpreter Discovery</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/release_and_maintenance.html">Release and maintenance</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/test_strategies.html">Testing Strategies</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../dev_guide/testing/sanity/index.html">Sanity Tests</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/faq.html">Frequently Asked Questions</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/glossary.html">Glossary</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/module_utils.html">Ansible Reference: Module Utilities</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/special_variables.html">Special Variables</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/tower.html">Red Hat Ansible Tower</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/automationhub.html">Ansible Automation Hub</a></li>
<li class="toctree-l1"><a class="reference internal" href="../../../reference_appendices/logging.html">Logging Ansible output</a></li>
</ul>
<p class="caption"><span class="caption-text">Roadmaps</span></p>
<ul>
<li class="toctree-l1"><a class="reference internal" href="../../../roadmap/index.html">Ansible Roadmap</a></li>
</ul>

            
          
        </div>
        
         <!-- extra nav elements for Ansible beyond RTD Sphinx Theme --->
<!-- changeable widget links to tower - do not change as image controlled by Ansible-->
<div id="sideBanner">
  <br/>
  <a href="https://www.ansible.com/docs-left?utm_source=docs">
    <img style="border-width:0px;" src="https://cdn2.hubspot.net/hubfs/330046/docs-graphics/ASB-docs-left-rail.png" />
  </a>
  <br/><br/><br/>
</div>
      </div>
    </nav>
  </div>

    <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">

      
      <nav class="wy-nav-top" aria-label="top navigation">
        
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../../../index.html">Ansible</a>
        
      </nav>


      <div class="wy-nav-content">
        
        <div class="rst-content">
        
          
















<div role="navigation" aria-label="breadcrumbs navigation">

  <ul class="wy-breadcrumbs">
    
      <li><a href="../../../index.html">Docs</a> &raquo;</li>
        
      <li>community.general.docker_container – manage docker containers</li>
    
    
      <li class="wy-breadcrumbs-aside">
        
            
            
              <!-- Ansible-specific additions for modules etc -->
                
                <!--  <a href="https://github.com/ansible/ansible/edit/devel/lib/ansible/modules/?description=%23%23%23%23%23%20SUMMARY%0A%3C!---%20Your%20description%20here%20--%3E%0A%0A%0A%23%23%23%23%23%20ISSUE%20TYPE%0A-%20Docs%20Pull%20Request%0A%0A%2Blabel:%20docsite_pr" class="fa fa-github"> Edit on GitHub</a> -->
                  <br>
                
            
          
        
      </li>
    
  </ul>

  
  <hr/>
</div>
          <!--- Based on sphinx versionwarning extension. Extension currently only works on READTHEDOCS -->
  <script>
    startsWith = function(str, needle) {
      return str.slice(0, needle.length) == needle
    }
    // Create a banner if we're not on the official docs site
    if (location.host == "docs.testing.ansible.com") {
      document.write('<div id="testing_banner_id" class="admonition important">');
      document.write('<p>This is the testing site for Ansible Documentation. Unless you are reviewing pre-production changes, please visit the <a href="https://docs.ansible.com/ansible/latest/">official documentation website</a>.</p> <p></p>');
      document.write('</div>');
    }
    
      // Create a banner if we're not the latest version
      current_url_path = window.location.pathname;
      if (startsWith(current_url_path, "/ansible/latest/") || startsWith(current_url_path, "/ansible/2.10/")) {
        document.write('<div id="banner_id" class="admonition caution">');
        document.write('<p>You are reading the latest community version of the Ansible documentation. Red Hat subscribers, select <b>2.9</b> in the version selection to the left for the most recent Red Hat release.</p>');
        document.write('</div>');

        /* temp banner to advertise AnsibleFest
        document.write('<div id="banner_id" class="admonition important">');
        document.write('<p><a href="https://www.ansible.com/ansiblefest?sc_cid=7013a000002gyPxAAI">AnsibleFest</a> is going virtual with two days of expert speakers, live demos and hands-on labs Oct 13-14!</p>');
        document.write('</div>'); */
      } else if (startsWith(current_url_path, "/ansible/2.9/")) {
        document.write('<div id="banner_id" class="admonition caution">');
        document.write('<p>You are reading the latest Red Hat released version of the Ansible documentation. Community users can use this, or select any version in version selection to the left, including <b>latest</b> for the most recent community version.</p>');
        document.write('</div>');
      } else if (startsWith(current_url_path, "/ansible/devel/")) {
        document.write('<div id="banner_id" class="admonition caution">');
        document.write('<p>You are reading the <b>devel</b> version of the Ansible documentation - this version is not guaranteed stable. Use the version selection to the left if you want the latest stable released version.</p>');
        document.write('</div>');
      } else {
        document.write('<div id="banner_id" class="admonition caution">');
        document.write('<p>You are reading an older version of the Ansible documentation. Use the version selection to the left if you want the latest stable released version.</p>');
        document.write('</div>');
      }
    
  </script>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
            
  <span class="target" id="ansible-collections-community-general-docker-container-module"></span><div class="section" id="community-general-docker-container-manage-docker-containers">
<h1>community.general.docker_container – manage docker containers<a class="headerlink" href="#community-general-docker-container-manage-docker-containers" title="Permalink to this headline">¶</a></h1>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>This plugin is part of the <a class="reference external" href="https://galaxy.ansible.com/community/general">community.general collection</a> (version 1.3.0).</p>
<p>To install it use: <code class="code docutils literal notranslate"><span class="pre">ansible-galaxy</span> <span class="pre">collection</span> <span class="pre">install</span> <span class="pre">community.general</span></code>.</p>
<p>To use it in a playbook, specify: <code class="code docutils literal notranslate"><span class="pre">community.general.docker_container</span></code>.</p>
</div>
<div class="contents local topic" id="contents">
<ul class="simple">
<li><p><a class="reference internal" href="#synopsis" id="id2">Synopsis</a></p></li>
<li><p><a class="reference internal" href="#requirements" id="id3">Requirements</a></p></li>
<li><p><a class="reference internal" href="#parameters" id="id4">Parameters</a></p></li>
<li><p><a class="reference internal" href="#notes" id="id5">Notes</a></p></li>
<li><p><a class="reference internal" href="#examples" id="id6">Examples</a></p></li>
<li><p><a class="reference internal" href="#return-values" id="id7">Return Values</a></p></li>
</ul>
</div>
<div class="section" id="synopsis">
<h2><a class="toc-backref" href="#id2">Synopsis</a><a class="headerlink" href="#synopsis" title="Permalink to this headline">¶</a></h2>
<ul class="simple">
<li><p>Manage the life cycle of docker containers.</p></li>
<li><p>Supports check mode. Run with <code class="docutils literal notranslate"><span class="pre">--check</span></code> and <code class="docutils literal notranslate"><span class="pre">--diff</span></code> to view config difference and list of actions to be taken.</p></li>
</ul>
</div>
<div class="section" id="requirements">
<h2><a class="toc-backref" href="#id3">Requirements</a><a class="headerlink" href="#requirements" title="Permalink to this headline">¶</a></h2>
<p>The below requirements are needed on the host that executes this module.</p>
<ul class="simple">
<li><p>Docker API &gt;= 1.20</p></li>
<li><p>Docker SDK for Python: Please note that the <a class="reference external" href="https://pypi.org/project/docker-py/">docker-py</a> Python module has been superseded by <a class="reference external" href="https://pypi.org/project/docker/">docker</a> (see <a class="reference external" href="https://github.com/docker/docker-py/issues/1310">here</a> for details). For Python 2.6, <code class="docutils literal notranslate"><span class="pre">docker-py</span></code> must be used. Otherwise, it is recommended to install the <code class="docutils literal notranslate"><span class="pre">docker</span></code> Python module. Note that both modules should <em>not</em> be installed at the same time. Also note that when both modules are installed and one of them is uninstalled, the other might no longer function and a reinstall of it is required.</p></li>
<li><p><a class="reference external" href="https://docker-py.readthedocs.io/en/stable/">Docker SDK for Python</a> &gt;= 1.8.0 (use <a class="reference external" href="https://pypi.org/project/docker-py/">docker-py</a> for Python 2.6)</p></li>
</ul>
</div>
<div class="section" id="parameters">
<h2><a class="toc-backref" href="#id4">Parameters</a><a class="headerlink" href="#parameters" title="Permalink to this headline">¶</a></h2>
<table  border=0 cellpadding=0 class="documentation-table">
    <tr>
        <th colspan="2">Parameter</th>
        <th>Choices/<font color="blue">Defaults</font></th>
                    <th width="100%">Comments</th>
    </tr>
                <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-api_version"></div>
                <b>api_version</b>
                <a class="ansibleOptionLink" href="#parameter-api_version" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                <b>Default:</b><br/><div style="color: blue">"auto"</div>
                                </td>
                                                            <td>
                                        <div>The version of the Docker API running on the Docker Host.</div>
                                        <div>Defaults to the latest version of the API supported by Docker SDK for Python and the docker daemon.</div>
                                        <div>If the value is not specified in the task, the value of environment variable <code>DOCKER_API_VERSION</code> will be used instead. If the environment variable is not set, the default value will be used.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: docker_api_version</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-auto_remove"></div>
                <b>auto_remove</b>
                <a class="ansibleOptionLink" href="#parameter-auto_remove" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Enable auto-removal of the container on daemon side when the container&#x27;s process exits.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>no</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-blkio_weight"></div>
                <b>blkio_weight</b>
                <a class="ansibleOptionLink" href="#parameter-blkio_weight" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Block IO (relative weight), between 10 and 1000.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-ca_cert"></div>
                <b>ca_cert</b>
                <a class="ansibleOptionLink" href="#parameter-ca_cert" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">path</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Use a CA certificate when performing server verification by providing the path to a CA certificate file.</div>
                                        <div>If the value is not specified in the task and the environment variable <code>DOCKER_CERT_PATH</code> is set, the file <code>ca.pem</code> from the directory specified in the environment variable <code>DOCKER_CERT_PATH</code> will be used.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: tls_ca_cert, cacert_path</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cap_drop"></div>
                <b>cap_drop</b>
                <a class="ansibleOptionLink" href="#parameter-cap_drop" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of capabilities to drop from the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-capabilities"></div>
                <b>capabilities</b>
                <a class="ansibleOptionLink" href="#parameter-capabilities" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of capabilities to add to the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cleanup"></div>
                <b>cleanup</b>
                <a class="ansibleOptionLink" href="#parameter-cleanup" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Use with <em>detach=false</em> to remove the container after successful execution.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-client_cert"></div>
                <b>client_cert</b>
                <a class="ansibleOptionLink" href="#parameter-client_cert" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">path</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Path to the client&#x27;s TLS certificate file.</div>
                                        <div>If the value is not specified in the task and the environment variable <code>DOCKER_CERT_PATH</code> is set, the file <code>cert.pem</code> from the directory specified in the environment variable <code>DOCKER_CERT_PATH</code> will be used.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: tls_client_cert, cert_path</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-client_key"></div>
                <b>client_key</b>
                <a class="ansibleOptionLink" href="#parameter-client_key" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">path</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Path to the client&#x27;s TLS key file.</div>
                                        <div>If the value is not specified in the task and the environment variable <code>DOCKER_CERT_PATH</code> is set, the file <code>key.pem</code> from the directory specified in the environment variable <code>DOCKER_CERT_PATH</code> will be used.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: tls_client_key, key_path</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-command"></div>
                <b>command</b>
                <a class="ansibleOptionLink" href="#parameter-command" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">raw</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Command to execute when the container starts. A command may be either a string or a list.</div>
                                        <div>Prior to version 2.4, strings were split on commas.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-comparisons"></div>
                <b>comparisons</b>
                <a class="ansibleOptionLink" href="#parameter-comparisons" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Allows to specify how properties of existing containers are compared with module options to decide whether the container should be recreated / updated or not.</div>
                                        <div>Only options which correspond to the state of a container as handled by the Docker daemon can be specified, as well as <code>networks</code>.</div>
                                        <div>Must be a dictionary specifying for an option one of the keys <code>strict</code>, <code>ignore</code> and <code>allow_more_present</code>.</div>
                                        <div>If <code>strict</code> is specified, values are tested for equality, and changes always result in updating or restarting. If <code>ignore</code> is specified, changes are ignored.</div>
                                        <div><code>allow_more_present</code> is allowed only for lists, sets and dicts. If it is specified for lists or sets, the container will only be updated or restarted if the module option contains a value which is not present in the container&#x27;s options. If the option is specified for a dict, the container will only be updated or restarted if the module option contains a key which isn&#x27;t present in the container&#x27;s option, or if the value of a key present differs.</div>
                                        <div>The wildcard option <code>*</code> can be used to set one of the default values <code>strict</code> or <code>ignore</code> to *all* comparisons which are not explicitly set to other values.</div>
                                        <div>See the examples for details.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-container_default_behavior"></div>
                <b>container_default_behavior</b>
                <a class="ansibleOptionLink" href="#parameter-container_default_behavior" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                      <div style="font-style: italic; font-size: small; color: darkgreen">
                    added in 0.2.0 of community.general
                  </div>
                                                    </td>
                            <td>
                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>compatibility</li>
                                                                                                                                                                                            <li>no_defaults</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Various module options used to have default values. This causes problems with containers which use different values for these options.</div>
                                        <div>The default value is <code>compatibility</code>, which will ensure that the default values are used when the values are not explicitly specified by the user.</div>
                                        <div>From community.general 3.0.0 on, the default value will switch to <code>no_defaults</code>. To avoid deprecation warnings, please set <em>container_default_behavior</em> to an explicit value.</div>
                                        <div>This affects the <em>auto_remove</em>, <em>detach</em>, <em>init</em>, <em>interactive</em>, <em>memory</em>, <em>paused</em>, <em>privileged</em>, <em>read_only</em> and <em>tty</em> options.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cpu_period"></div>
                <b>cpu_period</b>
                <a class="ansibleOptionLink" href="#parameter-cpu_period" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Limit CPU CFS (Completely Fair Scheduler) period.</div>
                                        <div>See <em>cpus</em> for an easier to use alternative.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cpu_quota"></div>
                <b>cpu_quota</b>
                <a class="ansibleOptionLink" href="#parameter-cpu_quota" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Limit CPU CFS (Completely Fair Scheduler) quota.</div>
                                        <div>See <em>cpus</em> for an easier to use alternative.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cpu_shares"></div>
                <b>cpu_shares</b>
                <a class="ansibleOptionLink" href="#parameter-cpu_shares" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>CPU shares (relative weight).</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cpus"></div>
                <b>cpus</b>
                <a class="ansibleOptionLink" href="#parameter-cpus" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">float</span>
                                                                </div>
                                      <div style="font-style: italic; font-size: small; color: darkgreen">
                    added in 0.2.0 of community.general
                  </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Specify how much of the available CPU resources a container can use.</div>
                                        <div>A value of <code>1.5</code> means that at most one and a half CPU (core) will be used.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cpuset_cpus"></div>
                <b>cpuset_cpus</b>
                <a class="ansibleOptionLink" href="#parameter-cpuset_cpus" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>CPUs in which to allow execution <code>1,3</code> or <code>1-3</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-cpuset_mems"></div>
                <b>cpuset_mems</b>
                <a class="ansibleOptionLink" href="#parameter-cpuset_mems" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Memory nodes (MEMs) in which to allow execution <code>0-3</code> or <code>0,1</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-debug"></div>
                <b>debug</b>
                <a class="ansibleOptionLink" href="#parameter-debug" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Debug mode</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-detach"></div>
                <b>detach</b>
                <a class="ansibleOptionLink" href="#parameter-detach" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Enable detached mode to leave the container running in background.</div>
                                        <div>If disabled, the task will reflect the status of the container run (failed if the command failed).</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>yes</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-device_read_bps"></div>
                <b>device_read_bps</b>
                <a class="ansibleOptionLink" href="#parameter-device_read_bps" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=dictionary</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of device path and read rate (bytes per second) from device.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_read_bps/path"></div>
                <b>path</b>
                <a class="ansibleOptionLink" href="#parameter-device_read_bps/path" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device path in the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_read_bps/rate"></div>
                <b>rate</b>
                <a class="ansibleOptionLink" href="#parameter-device_read_bps/rate" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device read limit in format <code>&lt;number&gt;[&lt;unit&gt;]</code>.</div>
                                        <div>Number is a positive integer. Unit can be one of <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte).</div>
                                        <div>Omitting the unit defaults to bytes.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-device_read_iops"></div>
                <b>device_read_iops</b>
                <a class="ansibleOptionLink" href="#parameter-device_read_iops" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=dictionary</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of device and read rate (IO per second) from device.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_read_iops/path"></div>
                <b>path</b>
                <a class="ansibleOptionLink" href="#parameter-device_read_iops/path" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device path in the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_read_iops/rate"></div>
                <b>rate</b>
                <a class="ansibleOptionLink" href="#parameter-device_read_iops/rate" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device read limit.</div>
                                        <div>Must be a positive integer.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-device_requests"></div>
                <b>device_requests</b>
                <a class="ansibleOptionLink" href="#parameter-device_requests" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=dictionary</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Allows to request additional resources, such as GPUs.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_requests/capabilities"></div>
                <b>capabilities</b>
                <a class="ansibleOptionLink" href="#parameter-device_requests/capabilities" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=list</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of lists of strings to request capabilities.</div>
                                        <div>The top-level list entries are combined by OR, and for every list entry, the entries in the list it contains are combined by AND.</div>
                                        <div>The driver tries to satisfy one of the sub-lists.</div>
                                        <div>Available capabilities for the <code>nvidia</code> driver can be found at <a href='https://github.com/NVIDIA/nvidia-container-runtime'>https://github.com/NVIDIA/nvidia-container-runtime</a>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_requests/count"></div>
                <b>count</b>
                <a class="ansibleOptionLink" href="#parameter-device_requests/count" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Number or devices to request.</div>
                                        <div>Set to <code>-1</code> to request all available devices.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_requests/device_ids"></div>
                <b>device_ids</b>
                <a class="ansibleOptionLink" href="#parameter-device_requests/device_ids" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of device IDs.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_requests/driver"></div>
                <b>driver</b>
                <a class="ansibleOptionLink" href="#parameter-device_requests/driver" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Which driver to use for this device.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_requests/options"></div>
                <b>options</b>
                <a class="ansibleOptionLink" href="#parameter-device_requests/options" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Driver-specific options.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-device_write_bps"></div>
                <b>device_write_bps</b>
                <a class="ansibleOptionLink" href="#parameter-device_write_bps" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=dictionary</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of device and write rate (bytes per second) to device.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_write_bps/path"></div>
                <b>path</b>
                <a class="ansibleOptionLink" href="#parameter-device_write_bps/path" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device path in the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_write_bps/rate"></div>
                <b>rate</b>
                <a class="ansibleOptionLink" href="#parameter-device_write_bps/rate" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device read limit in format <code>&lt;number&gt;[&lt;unit&gt;]</code>.</div>
                                        <div>Number is a positive integer. Unit can be one of <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte).</div>
                                        <div>Omitting the unit defaults to bytes.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-device_write_iops"></div>
                <b>device_write_iops</b>
                <a class="ansibleOptionLink" href="#parameter-device_write_iops" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=dictionary</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of device and write rate (IO per second) to device.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_write_iops/path"></div>
                <b>path</b>
                <a class="ansibleOptionLink" href="#parameter-device_write_iops/path" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device path in the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-device_write_iops/rate"></div>
                <b>rate</b>
                <a class="ansibleOptionLink" href="#parameter-device_write_iops/rate" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Device read limit.</div>
                                        <div>Must be a positive integer.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-devices"></div>
                <b>devices</b>
                <a class="ansibleOptionLink" href="#parameter-devices" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of host device bindings to add to the container.</div>
                                        <div>Each binding is a mapping expressed in the format <code>&lt;path_on_host&gt;:&lt;path_in_container&gt;:&lt;cgroup_permissions&gt;</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-dns_opts"></div>
                <b>dns_opts</b>
                <a class="ansibleOptionLink" href="#parameter-dns_opts" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of DNS options.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-dns_search_domains"></div>
                <b>dns_search_domains</b>
                <a class="ansibleOptionLink" href="#parameter-dns_search_domains" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of custom DNS search domains.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-dns_servers"></div>
                <b>dns_servers</b>
                <a class="ansibleOptionLink" href="#parameter-dns_servers" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of custom DNS servers.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-docker_host"></div>
                <b>docker_host</b>
                <a class="ansibleOptionLink" href="#parameter-docker_host" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                <b>Default:</b><br/><div style="color: blue">"unix://var/run/docker.sock"</div>
                                </td>
                                                            <td>
                                        <div>The URL or Unix socket path used to connect to the Docker API. To connect to a remote host, provide the TCP connection string. For example, <code>tcp://192.0.2.23:2376</code>. If TLS is used to encrypt the connection, the module will automatically replace <code>tcp</code> in the connection URL with <code>https</code>.</div>
                                        <div>If the value is not specified in the task, the value of environment variable <code>DOCKER_HOST</code> will be used instead. If the environment variable is not set, the default value will be used.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: docker_url</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-domainname"></div>
                <b>domainname</b>
                <a class="ansibleOptionLink" href="#parameter-domainname" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Container domainname.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-entrypoint"></div>
                <b>entrypoint</b>
                <a class="ansibleOptionLink" href="#parameter-entrypoint" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Command that overwrites the default <code>ENTRYPOINT</code> of the image.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-env"></div>
                <b>env</b>
                <a class="ansibleOptionLink" href="#parameter-env" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Dictionary of key,value pairs.</div>
                                        <div>Values which might be parsed as numbers, booleans or other types by the YAML parser must be quoted (e.g. <code>&quot;true&quot;</code>) in order to avoid data loss.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-env_file"></div>
                <b>env_file</b>
                <a class="ansibleOptionLink" href="#parameter-env_file" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">path</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Path to a file, present on the target, containing environment variables <em>FOO=BAR</em>.</div>
                                        <div>If variable also present in <em>env</em>, then the <em>env</em> value will override.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-etc_hosts"></div>
                <b>etc_hosts</b>
                <a class="ansibleOptionLink" href="#parameter-etc_hosts" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Dict of host-to-IP mappings, where each host name is a key in the dictionary. Each host name will be added to the container&#x27;s <code>/etc/hosts</code> file.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-exposed_ports"></div>
                <b>exposed_ports</b>
                <a class="ansibleOptionLink" href="#parameter-exposed_ports" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of additional container ports which informs Docker that the container listens on the specified network ports at runtime.</div>
                                        <div>If the port is already exposed using <code>EXPOSE</code> in a Dockerfile, it does not need to be exposed again.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: exposed, expose</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-force_kill"></div>
                <b>force_kill</b>
                <a class="ansibleOptionLink" href="#parameter-force_kill" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Use the kill command when stopping a running container.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: forcekill</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-groups"></div>
                <b>groups</b>
                <a class="ansibleOptionLink" href="#parameter-groups" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of additional group names and/or IDs that the container process will run as.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-healthcheck"></div>
                <b>healthcheck</b>
                <a class="ansibleOptionLink" href="#parameter-healthcheck" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Configure a check that is run to determine whether or not containers for this service are &quot;healthy&quot;.</div>
                                        <div>See the docs for the <a href='https://docs.docker.com/engine/reference/builder/#healthcheck'>HEALTHCHECK Dockerfile instruction</a> for details on how healthchecks work.</div>
                                        <div><em>interval</em>, <em>timeout</em> and <em>start_period</em> are specified as durations. They accept duration as a string in a format that look like: <code>5h34m56s</code>, <code>1m30s</code> etc. The supported units are <code>us</code>, <code>ms</code>, <code>s</code>, <code>m</code> and <code>h</code>.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-healthcheck/interval"></div>
                <b>interval</b>
                <a class="ansibleOptionLink" href="#parameter-healthcheck/interval" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Time between running the check.</div>
                                        <div>The default used by the Docker daemon is <code>30s</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-healthcheck/retries"></div>
                <b>retries</b>
                <a class="ansibleOptionLink" href="#parameter-healthcheck/retries" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Consecutive number of failures needed to report unhealthy.</div>
                                        <div>The default used by the Docker daemon is <code>3</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-healthcheck/start_period"></div>
                <b>start_period</b>
                <a class="ansibleOptionLink" href="#parameter-healthcheck/start_period" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Start period for the container to initialize before starting health-retries countdown.</div>
                                        <div>The default used by the Docker daemon is <code>0s</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-healthcheck/test"></div>
                <b>test</b>
                <a class="ansibleOptionLink" href="#parameter-healthcheck/test" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">raw</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Command to run to check health.</div>
                                        <div>Must be either a string or a list. If it is a list, the first item must be one of <code>NONE</code>, <code>CMD</code> or <code>CMD-SHELL</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-healthcheck/timeout"></div>
                <b>timeout</b>
                <a class="ansibleOptionLink" href="#parameter-healthcheck/timeout" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Maximum time to allow one check to run.</div>
                                        <div>The default used by the Docker daemon is <code>30s</code>.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-hostname"></div>
                <b>hostname</b>
                <a class="ansibleOptionLink" href="#parameter-hostname" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>The container&#x27;s hostname.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-ignore_image"></div>
                <b>ignore_image</b>
                <a class="ansibleOptionLink" href="#parameter-ignore_image" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>When <em>state</em> is <code>present</code> or <code>started</code>, the module compares the configuration of an existing container to requested configuration. The evaluation includes the image version. If the image version in the registry does not match the container, the container will be recreated. You can stop this behavior by setting <em>ignore_image</em> to <code>True</code>.</div>
                                        <div>*Warning:* This option is ignored if <code>image: ignore</code> or <code>*: ignore</code> is specified in the <em>comparisons</em> option.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-image"></div>
                <b>image</b>
                <a class="ansibleOptionLink" href="#parameter-image" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Repository path and tag used to create the container. If an image is not found or pull is true, the image will be pulled from the registry. If no tag is included, <code>latest</code> will be used.</div>
                                        <div>Can also be an image ID. If this is the case, the image is assumed to be available locally. The <em>pull</em> option is ignored for this case.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-init"></div>
                <b>init</b>
                <a class="ansibleOptionLink" href="#parameter-init" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Run an init inside the container that forwards signals and reaps processes.</div>
                                        <div>This option requires Docker API &gt;= 1.25.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>no</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-interactive"></div>
                <b>interactive</b>
                <a class="ansibleOptionLink" href="#parameter-interactive" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Keep stdin open after a container is launched, even if not attached.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>no</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-ipc_mode"></div>
                <b>ipc_mode</b>
                <a class="ansibleOptionLink" href="#parameter-ipc_mode" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Set the IPC mode for the container.</div>
                                        <div>Can be one of <code>container:&lt;name|id&gt;</code> to reuse another container&#x27;s IPC namespace or <code>host</code> to use the host&#x27;s IPC namespace within the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-keep_volumes"></div>
                <b>keep_volumes</b>
                <a class="ansibleOptionLink" href="#parameter-keep_volumes" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li><div style="color: blue"><b>yes</b>&nbsp;&larr;</div></li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Retain anonymous volumes associated with a removed container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-kernel_memory"></div>
                <b>kernel_memory</b>
                <a class="ansibleOptionLink" href="#parameter-kernel_memory" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Kernel memory limit in format <code>&lt;number&gt;[&lt;unit&gt;]</code>. Number is a positive integer. Unit can be <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte). Minimum is <code>4M</code>.</div>
                                        <div>Omitting the unit defaults to bytes.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-kill_signal"></div>
                <b>kill_signal</b>
                <a class="ansibleOptionLink" href="#parameter-kill_signal" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Override default signal used to kill a running container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-labels"></div>
                <b>labels</b>
                <a class="ansibleOptionLink" href="#parameter-labels" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Dictionary of key value pairs.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-links"></div>
                <b>links</b>
                <a class="ansibleOptionLink" href="#parameter-links" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of name aliases for linked containers in the format <code>container_name:alias</code>.</div>
                                        <div>Setting this will force container to be restarted.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-log_driver"></div>
                <b>log_driver</b>
                <a class="ansibleOptionLink" href="#parameter-log_driver" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Specify the logging driver. Docker uses <code>json-file</code> by default.</div>
                                        <div>See <a href='https://docs.docker.com/config/containers/logging/configure/'>here</a> for possible choices.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-log_options"></div>
                <b>log_options</b>
                <a class="ansibleOptionLink" href="#parameter-log_options" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Dictionary of options specific to the chosen <em>log_driver</em>.</div>
                                        <div>See <a href='https://docs.docker.com/engine/admin/logging/overview/'>https://docs.docker.com/engine/admin/logging/overview/</a> for details.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: log_opt</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-mac_address"></div>
                <b>mac_address</b>
                <a class="ansibleOptionLink" href="#parameter-mac_address" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Container MAC address (e.g. 92:d0:c6:0a:29:33).</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-memory"></div>
                <b>memory</b>
                <a class="ansibleOptionLink" href="#parameter-memory" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Memory limit in format <code>&lt;number&gt;[&lt;unit&gt;]</code>. Number is a positive integer. Unit can be <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte).</div>
                                        <div>Omitting the unit defaults to bytes.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>&quot;0&quot;</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-memory_reservation"></div>
                <b>memory_reservation</b>
                <a class="ansibleOptionLink" href="#parameter-memory_reservation" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Memory soft limit in format <code>&lt;number&gt;[&lt;unit&gt;]</code>. Number is a positive integer. Unit can be <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte).</div>
                                        <div>Omitting the unit defaults to bytes.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-memory_swap"></div>
                <b>memory_swap</b>
                <a class="ansibleOptionLink" href="#parameter-memory_swap" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Total memory limit (memory + swap) in format <code>&lt;number&gt;[&lt;unit&gt;]</code>. Number is a positive integer. Unit can be <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte).</div>
                                        <div>Omitting the unit defaults to bytes.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-memory_swappiness"></div>
                <b>memory_swappiness</b>
                <a class="ansibleOptionLink" href="#parameter-memory_swappiness" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Tune a container&#x27;s memory swappiness behavior. Accepts an integer between 0 and 100.</div>
                                        <div>If not set, the value will be remain the same if container exists and will be inherited from the host machine if it is (re-)created.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-mounts"></div>
                <b>mounts</b>
                <a class="ansibleOptionLink" href="#parameter-mounts" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=dictionary</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Specification for mounts to be added to the container. More powerful alternative to <em>volumes</em>.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/consistency"></div>
                <b>consistency</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/consistency" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>cached</li>
                                                                                                                                                                                            <li>consistent</li>
                                                                                                                                                                                            <li>default</li>
                                                                                                                                                                                            <li>delegated</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>The consistency requirement for the mount.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/labels"></div>
                <b>labels</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/labels" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>User-defined name and labels for the volume. Only valid for the <code>volume</code> type.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/no_copy"></div>
                <b>no_copy</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/no_copy" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>False if the volume should be populated with the data from the target. Only valid for the <code>volume</code> type.</div>
                                        <div>The default value is <code>false</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/propagation"></div>
                <b>propagation</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/propagation" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>private</li>
                                                                                                                                                                                            <li>rprivate</li>
                                                                                                                                                                                            <li>shared</li>
                                                                                                                                                                                            <li>rshared</li>
                                                                                                                                                                                            <li>slave</li>
                                                                                                                                                                                            <li>rslave</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Propagation mode. Only valid for the <code>bind</code> type.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/read_only"></div>
                <b>read_only</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/read_only" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Whether the mount should be read-only.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/source"></div>
                <b>source</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/source" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Mount source (e.g. a volume name or a host path).</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/target"></div>
                <b>target</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/target" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Path inside the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/tmpfs_mode"></div>
                <b>tmpfs_mode</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/tmpfs_mode" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>The permission mode for the tmpfs mount.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/tmpfs_size"></div>
                <b>tmpfs_size</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/tmpfs_size" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>The size for the tmpfs mount in bytes in format &lt;number&gt;[&lt;unit&gt;].</div>
                                        <div>Number is a positive integer. Unit can be one of <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte).</div>
                                        <div>Omitting the unit defaults to bytes.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/type"></div>
                <b>type</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/type" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>bind</li>
                                                                                                                                                                                            <li>npipe</li>
                                                                                                                                                                                            <li>tmpfs</li>
                                                                                                                                                                                            <li><div style="color: blue"><b>volume</b>&nbsp;&larr;</div></li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>The mount type.</div>
                                        <div>Note that <code>npipe</code> is only supported by Docker for Windows.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/volume_driver"></div>
                <b>volume_driver</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/volume_driver" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Specify the volume driver. Only valid for the <code>volume</code> type.</div>
                                        <div>See <a href='https://docs.docker.com/storage/volumes/#use-a-volume-driver'>here</a> for details.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-mounts/volume_options"></div>
                <b>volume_options</b>
                <a class="ansibleOptionLink" href="#parameter-mounts/volume_options" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Dictionary of options specific to the chosen volume_driver. See <a href='https://docs.docker.com/storage/volumes/#use-a-volume-driver'>here</a> for details.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-name"></div>
                <b>name</b>
                <a class="ansibleOptionLink" href="#parameter-name" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Assign a name to a new container or match an existing container.</div>
                                        <div>When identifying an existing container name may be a name or a long or short container ID.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-network_mode"></div>
                <b>network_mode</b>
                <a class="ansibleOptionLink" href="#parameter-network_mode" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Connect the container to a network. Choices are <code>bridge</code>, <code>host</code>, <code>none</code>, <code>container:&lt;name|id&gt;</code>, <code>&lt;network_name&gt;</code> or <code>default</code>.</div>
                                        <div>*Note* that from community.general 3.0.0 on, if <em>networks_cli_compatible</em> is <code>true</code> and <em>networks</em> contains at least one network, the default value for <em>network_mode</em> will be the name of the first network in the <em>networks</em> list. You can prevent this by explicitly specifying a value for <em>network_mode</em>, like the default value <code>default</code> which will be used by Docker if <em>network_mode</em> is not specified.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-networks"></div>
                <b>networks</b>
                <a class="ansibleOptionLink" href="#parameter-networks" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=dictionary</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of networks the container belongs to.</div>
                                        <div>For examples of the data structure and usage see EXAMPLES below.</div>
                                        <div>To remove a container from one or more networks, use the <em>purge_networks</em> option.</div>
                                        <div>Note that as opposed to <code>docker run ...</code>, <span class='module'>community.general.docker_container</span> does not remove the default network if <em>networks</em> is specified. You need to explicitly use <em>purge_networks</em> to enforce the removal of the default network (and all other networks not explicitly mentioned in <em>networks</em>). Alternatively, use the <em>networks_cli_compatible</em> option, which will be enabled by default from community.general 2.0.0 on.</div>
                                                    </td>
        </tr>
                                    <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-networks/aliases"></div>
                <b>aliases</b>
                <a class="ansibleOptionLink" href="#parameter-networks/aliases" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of aliases for this container in this network. These names can be used in the network to reach this container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-networks/ipv4_address"></div>
                <b>ipv4_address</b>
                <a class="ansibleOptionLink" href="#parameter-networks/ipv4_address" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>The container&#x27;s IPv4 address in this network.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-networks/ipv6_address"></div>
                <b>ipv6_address</b>
                <a class="ansibleOptionLink" href="#parameter-networks/ipv6_address" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>The container&#x27;s IPv6 address in this network.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-networks/links"></div>
                <b>links</b>
                <a class="ansibleOptionLink" href="#parameter-networks/links" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>A list of containers to link to.</div>
                                                    </td>
        </tr>
                            <tr>
                                                <td class="elbow-placeholder"></td>
                                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="parameter-networks/name"></div>
                <b>name</b>
                <a class="ansibleOptionLink" href="#parameter-networks/name" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                             / <span style="color: red">required</span>                    </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>The network&#x27;s name.</div>
                                                    </td>
        </tr>

                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-networks_cli_compatible"></div>
                <b>networks_cli_compatible</b>
                <a class="ansibleOptionLink" href="#parameter-networks_cli_compatible" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>When networks are provided to the module via the <em>networks</em> option, the module behaves differently than <code>docker run --network</code>: <code>docker run --network other</code> will create a container with network <code>other</code> attached, but the default network not attached. This module with <em>networks: {name: other}</em> will create a container with both <code>default</code> and <code>other</code> attached. If <em>purge_networks</em> is set to <code>yes</code>, the <code>default</code> network will be removed afterwards.</div>
                                        <div>If <em>networks_cli_compatible</em> is set to <code>yes</code>, this module will behave as <code>docker run --network</code> and will *not* add the default network if <em>networks</em> is specified. If <em>networks</em> is not specified, the default network will be attached.</div>
                                        <div>*Note* that docker CLI also sets <em>network_mode</em> to the name of the first network added if <code>--network</code> is specified. For more compatibility with docker CLI, you explicitly have to set <em>network_mode</em> to the name of the first network you&#x27;re adding. This behavior will change for community.general 3.0.0: then <em>network_mode</em> will automatically be set to the first network name in <em>networks</em> if <em>network_mode</em> is not specified, <em>networks</em> has at least one entry and <em>networks_cli_compatible</em> is <code>true</code>.</div>
                                        <div>Current value is <code>no</code>. A new default of <code>yes</code> will be set in community.general 2.0.0.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-oom_killer"></div>
                <b>oom_killer</b>
                <a class="ansibleOptionLink" href="#parameter-oom_killer" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Whether or not to disable OOM Killer for the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-oom_score_adj"></div>
                <b>oom_score_adj</b>
                <a class="ansibleOptionLink" href="#parameter-oom_score_adj" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>An integer value containing the score given to the container in order to tune OOM killer preferences.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-output_logs"></div>
                <b>output_logs</b>
                <a class="ansibleOptionLink" href="#parameter-output_logs" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>If set to true, output of the container command will be printed.</div>
                                        <div>Only effective when <em>log_driver</em> is set to <code>json-file</code> or <code>journald</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-paused"></div>
                <b>paused</b>
                <a class="ansibleOptionLink" href="#parameter-paused" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Use with the started state to pause running processes inside the container.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>no</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-pid_mode"></div>
                <b>pid_mode</b>
                <a class="ansibleOptionLink" href="#parameter-pid_mode" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Set the PID namespace mode for the container.</div>
                                        <div>Note that Docker SDK for Python &lt; 2.0 only supports <code>host</code>. Newer versions of the Docker SDK for Python (docker) allow all values supported by the Docker daemon.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-pids_limit"></div>
                <b>pids_limit</b>
                <a class="ansibleOptionLink" href="#parameter-pids_limit" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Set PIDs limit for the container. It accepts an integer value.</div>
                                        <div>Set <code>-1</code> for unlimited PIDs.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-privileged"></div>
                <b>privileged</b>
                <a class="ansibleOptionLink" href="#parameter-privileged" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Give extended privileges to the container.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>no</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-published_ports"></div>
                <b>published_ports</b>
                <a class="ansibleOptionLink" href="#parameter-published_ports" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of ports to publish from the container to the host.</div>
                                        <div>Use docker CLI syntax: <code>8000</code>, <code>9000:8000</code>, or <code>0.0.0.0:9000:8000</code>, where 8000 is a container port, 9000 is a host port, and 0.0.0.0 is a host interface.</div>
                                        <div>Port ranges can be used for source and destination ports. If two ranges with different lengths are specified, the shorter range will be used. Since community.general 0.2.0, if the source port range has length 1, the port will not be assigned to the first port of the destination range, but to a free port in that range. This is the same behavior as for <code>docker</code> command line utility.</div>
                                        <div>Bind addresses must be either IPv4 or IPv6 addresses. Hostnames are *not* allowed. This is different from the <code>docker</code> command line utility. Use the <a href='../lookup/dig.html'>dig lookup</a> to resolve hostnames.</div>
                                        <div>A value of <code>all</code> will publish all exposed container ports to random host ports, ignoring any other mappings.</div>
                                        <div>If <em>networks</em> parameter is provided, will inspect each network to see if there exists a bridge network with optional parameter <code>com.docker.network.bridge.host_binding_ipv4</code>. If such a network is found, then published ports where no host IP address is specified will be bound to the host IP pointed to by <code>com.docker.network.bridge.host_binding_ipv4</code>. Note that the first bridge network with a <code>com.docker.network.bridge.host_binding_ipv4</code> value encountered in the list of <em>networks</em> is the one that will be used.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: ports</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-pull"></div>
                <b>pull</b>
                <a class="ansibleOptionLink" href="#parameter-pull" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>If true, always pull the latest version of an image. Otherwise, will only pull an image when missing.</div>
                                        <div>*Note:* images are only pulled when specified by name. If the image is specified as a image ID (hash), it cannot be pulled.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-purge_networks"></div>
                <b>purge_networks</b>
                <a class="ansibleOptionLink" href="#parameter-purge_networks" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Remove the container from ALL networks not included in <em>networks</em> parameter.</div>
                                        <div>Any default networks such as <code>bridge</code>, if not found in <em>networks</em>, will be removed as well.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-read_only"></div>
                <b>read_only</b>
                <a class="ansibleOptionLink" href="#parameter-read_only" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Mount the container&#x27;s root file system as read-only.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>no</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-recreate"></div>
                <b>recreate</b>
                <a class="ansibleOptionLink" href="#parameter-recreate" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Use with present and started states to force the re-creation of an existing container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-removal_wait_timeout"></div>
                <b>removal_wait_timeout</b>
                <a class="ansibleOptionLink" href="#parameter-removal_wait_timeout" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">float</span>
                                                                </div>
                                      <div style="font-style: italic; font-size: small; color: darkgreen">
                    added in 0.2.0 of community.general
                  </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>When removing an existing container, the docker daemon API call exists after the container is scheduled for removal. Removal usually is very fast, but it can happen that during high I/O load, removal can take longer. By default, the module will wait until the container has been removed before trying to (re-)create it, however long this takes.</div>
                                        <div>By setting this option, the module will wait at most this many seconds for the container to be removed. If the container is still in the removal phase after this many seconds, the module will fail.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-restart"></div>
                <b>restart</b>
                <a class="ansibleOptionLink" href="#parameter-restart" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Use with started state to force a matching container to be stopped and restarted.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-restart_policy"></div>
                <b>restart_policy</b>
                <a class="ansibleOptionLink" href="#parameter-restart_policy" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>on-failure</li>
                                                                                                                                                                                            <li>always</li>
                                                                                                                                                                                            <li>unless-stopped</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Container restart policy.</div>
                                        <div>Place quotes around <code>no</code> option.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-restart_retries"></div>
                <b>restart_retries</b>
                <a class="ansibleOptionLink" href="#parameter-restart_retries" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Use with restart policy to control maximum number of restart attempts.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-runtime"></div>
                <b>runtime</b>
                <a class="ansibleOptionLink" href="#parameter-runtime" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Runtime to use for the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-security_opts"></div>
                <b>security_opts</b>
                <a class="ansibleOptionLink" href="#parameter-security_opts" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of security options in the form of <code>&quot;label:user:User&quot;</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-shm_size"></div>
                <b>shm_size</b>
                <a class="ansibleOptionLink" href="#parameter-shm_size" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Size of <code>/dev/shm</code> in format <code>&lt;number&gt;[&lt;unit&gt;]</code>. Number is positive integer. Unit can be <code>B</code> (byte), <code>K</code> (kibibyte, 1024B), <code>M</code> (mebibyte), <code>G</code> (gibibyte), <code>T</code> (tebibyte), or <code>P</code> (pebibyte).</div>
                                        <div>Omitting the unit defaults to bytes. If you omit the size entirely, Docker daemon uses <code>64M</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-ssl_version"></div>
                <b>ssl_version</b>
                <a class="ansibleOptionLink" href="#parameter-ssl_version" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Provide a valid SSL version number. Default value determined by ssl.py module.</div>
                                        <div>If the value is not specified in the task, the value of environment variable <code>DOCKER_SSL_VERSION</code> will be used instead.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-state"></div>
                <b>state</b>
                <a class="ansibleOptionLink" href="#parameter-state" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                        <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>absent</li>
                                                                                                                                                                                            <li>present</li>
                                                                                                                                                                                            <li>stopped</li>
                                                                                                                                                                                            <li><div style="color: blue"><b>started</b>&nbsp;&larr;</div></li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div><code>absent</code> - A container matching the specified name will be stopped and removed. Use <em>force_kill</em> to kill the container rather than stopping it. Use <em>keep_volumes</em> to retain anonymous volumes associated with the removed container.</div>
                                        <div><code>present</code> - Asserts the existence of a container matching the name and any provided configuration parameters. If no container matches the name, a container will be created. If a container matches the name but the provided configuration does not match, the container will be updated, if it can be. If it cannot be updated, it will be removed and re-created with the requested config.</div>
                                        <div><code>started</code> - Asserts that the container is first <code>present</code>, and then if the container is not running moves it to a running state. Use <em>restart</em> to force a matching container to be stopped and restarted.</div>
                                        <div><code>stopped</code> - Asserts that the container is first <code>present</code>, and then if the container is running moves it to a stopped state.</div>
                                        <div>To control what will be taken into account when comparing configuration, see the <em>comparisons</em> option. To avoid that the image version will be taken into account, you can also use the <em>ignore_image</em> option.</div>
                                        <div>Use the <em>recreate</em> option to always force re-creation of a matching container, even if it is running.</div>
                                        <div>If the container should be killed instead of stopped in case it needs to be stopped for recreation, or because <em>state</em> is <code>stopped</code>, please use the <em>force_kill</em> option. Use <em>keep_volumes</em> to retain anonymous volumes associated with a removed container.</div>
                                        <div>Use <em>keep_volumes</em> to retain anonymous volumes associated with a removed container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-stop_signal"></div>
                <b>stop_signal</b>
                <a class="ansibleOptionLink" href="#parameter-stop_signal" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Override default signal used to stop the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-stop_timeout"></div>
                <b>stop_timeout</b>
                <a class="ansibleOptionLink" href="#parameter-stop_timeout" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Number of seconds to wait for the container to stop before sending <code>SIGKILL</code>. When the container is created by this module, its <code>StopTimeout</code> configuration will be set to this value.</div>
                                        <div>When the container is stopped, will be used as a timeout for stopping the container. In case the container has a custom <code>StopTimeout</code> configuration, the behavior depends on the version of the docker daemon. New versions of the docker daemon will always use the container&#x27;s configured <code>StopTimeout</code> value if it has been configured.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-sysctls"></div>
                <b>sysctls</b>
                <a class="ansibleOptionLink" href="#parameter-sysctls" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">dictionary</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Dictionary of key,value pairs.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-timeout"></div>
                <b>timeout</b>
                <a class="ansibleOptionLink" href="#parameter-timeout" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">integer</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                <b>Default:</b><br/><div style="color: blue">60</div>
                                </td>
                                                            <td>
                                        <div>The maximum amount of time in seconds to wait on a response from the API.</div>
                                        <div>If the value is not specified in the task, the value of environment variable <code>DOCKER_TIMEOUT</code> will be used instead. If the environment variable is not set, the default value will be used.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-tls"></div>
                <b>tls</b>
                <a class="ansibleOptionLink" href="#parameter-tls" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Secure the connection to the API by using TLS without verifying the authenticity of the Docker host server. Note that if <em>validate_certs</em> is set to <code>yes</code> as well, it will take precedence.</div>
                                        <div>If the value is not specified in the task, the value of environment variable <code>DOCKER_TLS</code> will be used instead. If the environment variable is not set, the default value will be used.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-tls_hostname"></div>
                <b>tls_hostname</b>
                <a class="ansibleOptionLink" href="#parameter-tls_hostname" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                <b>Default:</b><br/><div style="color: blue">"localhost"</div>
                                </td>
                                                            <td>
                                        <div>When verifying the authenticity of the Docker Host server, provide the expected name of the server.</div>
                                        <div>If the value is not specified in the task, the value of environment variable <code>DOCKER_TLS_HOSTNAME</code> will be used instead. If the environment variable is not set, the default value will be used.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-tmpfs"></div>
                <b>tmpfs</b>
                <a class="ansibleOptionLink" href="#parameter-tmpfs" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Mount a tmpfs directory.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-trust_image_content"></div>
                <b>trust_image_content</b>
                <a class="ansibleOptionLink" href="#parameter-trust_image_content" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>If <code>yes</code>, skip image verification.</div>
                                        <div>The option has never been used by the module. It will be removed in community.general 3.0.0.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-tty"></div>
                <b>tty</b>
                <a class="ansibleOptionLink" href="#parameter-tty" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                    <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li>no</li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Allocate a pseudo-TTY.</div>
                                        <div>If <em>container_default_behavior</em> is set to <code>compatiblity</code> (the default value), this option has a default of <code>no</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-ulimits"></div>
                <b>ulimits</b>
                <a class="ansibleOptionLink" href="#parameter-ulimits" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of ulimit options. A ulimit is specified as <code>nofile:262144:262144</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-user"></div>
                <b>user</b>
                <a class="ansibleOptionLink" href="#parameter-user" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Sets the username or UID used and optionally the groupname or GID for the specified command.</div>
                                        <div>Can be of the forms <code>user</code>, <code>user:group</code>, <code>uid</code>, <code>uid:gid</code>, <code>user:gid</code> or <code>uid:group</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-userns_mode"></div>
                <b>userns_mode</b>
                <a class="ansibleOptionLink" href="#parameter-userns_mode" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Set the user namespace mode for the container. Currently, the only valid value are <code>host</code> and the empty string.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-uts"></div>
                <b>uts</b>
                <a class="ansibleOptionLink" href="#parameter-uts" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Set the UTS namespace mode for the container.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-validate_certs"></div>
                <b>validate_certs</b>
                <a class="ansibleOptionLink" href="#parameter-validate_certs" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">boolean</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                                                                                <ul style="margin: 0; padding: 0"><b>Choices:</b>
                                                                                                                                                            <li><div style="color: blue"><b>no</b>&nbsp;&larr;</div></li>
                                                                                                                                                                                            <li>yes</li>
                                                                                </ul>
                                                                        </td>
                                                            <td>
                                        <div>Secure the connection to the API by using TLS and verifying the authenticity of the Docker host server.</div>
                                        <div>If the value is not specified in the task, the value of environment variable <code>DOCKER_TLS_VERIFY</code> will be used instead. If the environment variable is not set, the default value will be used.</div>
                                                            <div style="font-size: small; color: darkgreen"><br/>aliases: tls_verify</div>
                                </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-volume_driver"></div>
                <b>volume_driver</b>
                <a class="ansibleOptionLink" href="#parameter-volume_driver" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>The container volume driver.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-volumes"></div>
                <b>volumes</b>
                <a class="ansibleOptionLink" href="#parameter-volumes" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of volumes to mount within the container.</div>
                                        <div>Use docker CLI-style syntax: <code>/host:/container[:mode]</code></div>
                                        <div>Mount modes can be a comma-separated list of various modes such as <code>ro</code>, <code>rw</code>, <code>consistent</code>, <code>delegated</code>, <code>cached</code>, <code>rprivate</code>, <code>private</code>, <code>rshared</code>, <code>shared</code>, <code>rslave</code>, <code>slave</code>, and <code>nocopy</code>. Note that the docker daemon might not support all modes and combinations of such modes.</div>
                                        <div>SELinux hosts can additionally use <code>z</code> or <code>Z</code> to use a shared or private label for the volume.</div>
                                        <div>Note that Ansible 2.7 and earlier only supported one mode, which had to be one of <code>ro</code>, <code>rw</code>, <code>z</code>, and <code>Z</code>.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-volumes_from"></div>
                <b>volumes_from</b>
                <a class="ansibleOptionLink" href="#parameter-volumes_from" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">list</span>
                     / <span style="color: purple">elements=string</span>                                            </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>List of container names or IDs to get volumes from.</div>
                                                    </td>
        </tr>
                            <tr>
                                                            <td colspan="2">
                <div class="ansibleOptionAnchor" id="parameter-working_dir"></div>
                <b>working_dir</b>
                <a class="ansibleOptionLink" href="#parameter-working_dir" title="Permalink to this option"></a>
                <div style="font-size: small">
                    <span style="color: purple">string</span>
                                                                </div>
                                                    </td>
                            <td>
                                                                                                                                                        </td>
                                                            <td>
                                        <div>Path to the working directory.</div>
                                                    </td>
        </tr>
                    </table>
<br/></div>
<div class="section" id="notes">
<h2><a class="toc-backref" href="#id5">Notes</a><a class="headerlink" href="#notes" title="Permalink to this headline">¶</a></h2>
<div class="admonition note">
<p class="admonition-title">Note</p>
<ul class="simple">
<li><p>For most config changes, the container needs to be recreated, i.e. the existing container has to be destroyed and a new one created. This can cause unexpected data loss and downtime. You can use the <em>comparisons</em> option to prevent this.</p></li>
<li><p>If the module needs to recreate the container, it will only use the options provided to the module to create the new container (except <em>image</em>). Therefore, always specify <em>all</em> options relevant to the container.</p></li>
<li><p>When <em>restart</em> is set to <code class="docutils literal notranslate"><span class="pre">true</span></code>, the module will only restart the container if no config changes are detected. Please note that several options have default values; if the container to be restarted uses different values for these options, it will be recreated instead. The options with default values which can cause this are <em>auto_remove</em>, <em>detach</em>, <em>init</em>, <em>interactive</em>, <em>memory</em>, <em>paused</em>, <em>privileged</em>, <em>read_only</em> and <em>tty</em>. This behavior can be changed by setting <em>container_default_behavior</em> to <code class="docutils literal notranslate"><span class="pre">no_defaults</span></code>, which will be the default value from community.general 3.0.0 on.</p></li>
<li><p>Connect to the Docker daemon by providing parameters with each task or by defining environment variables. You can define <code class="docutils literal notranslate"><span class="pre">DOCKER_HOST</span></code>, <code class="docutils literal notranslate"><span class="pre">DOCKER_TLS_HOSTNAME</span></code>, <code class="docutils literal notranslate"><span class="pre">DOCKER_API_VERSION</span></code>, <code class="docutils literal notranslate"><span class="pre">DOCKER_CERT_PATH</span></code>, <code class="docutils literal notranslate"><span class="pre">DOCKER_SSL_VERSION</span></code>, <code class="docutils literal notranslate"><span class="pre">DOCKER_TLS</span></code>, <code class="docutils literal notranslate"><span class="pre">DOCKER_TLS_VERIFY</span></code> and <code class="docutils literal notranslate"><span class="pre">DOCKER_TIMEOUT</span></code>. If you are using docker machine, run the script shipped with the product that sets up the environment. It will set these variables for you. See <a class="reference external" href="https://docs.docker.com/machine/reference/env/">https://docs.docker.com/machine/reference/env/</a> for more details.</p></li>
<li><p>When connecting to Docker daemon with TLS, you might need to install additional Python packages. For the Docker SDK for Python, version 2.4 or newer, this can be done by installing <code class="docutils literal notranslate"><span class="pre">docker[tls]</span></code> with <a class="reference internal" href="../../ansible/builtin/pip_module.html#ansible-collections-ansible-builtin-pip-module"><span class="std std-ref">ansible.builtin.pip</span></a>.</p></li>
<li><p>Note that the Docker SDK for Python only allows to specify the path to the Docker configuration for very few functions. In general, it will use <code class="docutils literal notranslate"><span class="pre">$HOME/.docker/config.json</span></code> if the <code class="docutils literal notranslate"><span class="pre">DOCKER_CONFIG</span></code> environment variable is not specified, and use <code class="docutils literal notranslate"><span class="pre">$DOCKER_CONFIG/config.json</span></code> otherwise.</p></li>
</ul>
</div>
</div>
<div class="section" id="examples">
<h2><a class="toc-backref" href="#id6">Examples</a><a class="headerlink" href="#examples" title="Permalink to this headline">¶</a></h2>
<div class="highlight-yaml+jinja notranslate"><div class="highlight"><pre><span></span><span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Create a data container</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">mydata</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">busybox</span>
    <span class="nt">volumes</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">/data</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Re-create a redis container</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">myredis</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">redis</span>
    <span class="nt">command</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">redis-server --appendonly yes</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">present</span>
    <span class="nt">recreate</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">yes</span>
    <span class="nt">exposed_ports</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">6379</span>
    <span class="nt">volumes_from</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">mydata</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Restart a container</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">myapplication</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">someuser/appimage</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">started</span>
    <span class="nt">restart</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">yes</span>
    <span class="nt">links</span><span class="p">:</span>
     <span class="p p-Indicator">-</span> <span class="s">&quot;myredis:aliasedredis&quot;</span>
    <span class="nt">devices</span><span class="p">:</span>
     <span class="p p-Indicator">-</span> <span class="s">&quot;/dev/sda:/dev/xvda:rwm&quot;</span>
    <span class="nt">ports</span><span class="p">:</span>
     <span class="c1"># Publish container port 9000 as host port 8080</span>
     <span class="p p-Indicator">-</span> <span class="s">&quot;8080:9000&quot;</span>
     <span class="c1"># Publish container UDP port 9001 as host port 8081 on interface 127.0.0.1</span>
     <span class="p p-Indicator">-</span> <span class="s">&quot;127.0.0.1:8081:9001/udp&quot;</span>
     <span class="c1"># Publish container port 9002 as a random host port</span>
     <span class="p p-Indicator">-</span> <span class="s">&quot;9002&quot;</span>
     <span class="c1"># Publish container port 9003 as a free host port in range 8000-8100</span>
     <span class="c1"># (the host port will be selected by the Docker daemon)</span>
     <span class="p p-Indicator">-</span> <span class="s">&quot;8000-8100:9003&quot;</span>
     <span class="c1"># Publish container ports 9010-9020 to host ports 7000-7010</span>
     <span class="p p-Indicator">-</span> <span class="s">&quot;7000-7010:9010-9020&quot;</span>
    <span class="nt">env</span><span class="p">:</span>
        <span class="nt">SECRET_KEY</span><span class="p">:</span> <span class="s">&quot;ssssh&quot;</span>
        <span class="c1"># Values which might be parsed as numbers, booleans or other types by the YAML parser need to be quoted</span>
        <span class="nt">BOOLEAN_KEY</span><span class="p">:</span> <span class="s">&quot;yes&quot;</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Container present</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">mycontainer</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">present</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:14.04</span>
    <span class="nt">command</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleep infinity</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Stop a container</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">mycontainer</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">stopped</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Start 4 load-balanced containers</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="s">&quot;container</span><span class="cp">{{</span> <span class="nv">item</span> <span class="cp">}}</span><span class="s">&quot;</span>
    <span class="nt">recreate</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">yes</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">someuser/anotherappimage</span>
    <span class="nt">command</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleep 1d</span>
  <span class="nt">with_sequence</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">count=4</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Remove container</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ohno</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">absent</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Syslogging output</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">myservice</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">busybox</span>
    <span class="nt">log_driver</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">syslog</span>
    <span class="nt">log_options</span><span class="p">:</span>
      <span class="nt">syslog-address</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">tcp://my-syslog-server:514</span>
      <span class="nt">syslog-facility</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">daemon</span>
      <span class="c1"># NOTE: in Docker 1.13+ the &quot;syslog-tag&quot; option was renamed to &quot;tag&quot; for</span>
      <span class="c1"># older docker installs, use &quot;syslog-tag&quot; instead</span>
      <span class="nt">tag</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">myservice</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Create db container and connect to network</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">db_test</span>
    <span class="nt">image</span><span class="p">:</span> <span class="s">&quot;postgres:latest&quot;</span>
    <span class="nt">networks</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="s">&quot;</span><span class="cp">{{</span> <span class="nv">docker_network_name</span> <span class="cp">}}</span><span class="s">&quot;</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Start container, connect to network and link</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleeper</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:14.04</span>
    <span class="nt">networks</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">TestingNet</span>
        <span class="nt">ipv4_address</span><span class="p">:</span> <span class="s">&quot;172.1.1.100&quot;</span>
        <span class="nt">aliases</span><span class="p">:</span>
          <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">sleepyzz</span>
        <span class="nt">links</span><span class="p">:</span>
          <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">db_test:db</span>
      <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">TestingNet2</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Start a container with a command</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleepy</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:14.04</span>
    <span class="nt">command</span><span class="p">:</span> <span class="p p-Indicator">[</span><span class="s">&quot;sleep&quot;</span><span class="p p-Indicator">,</span> <span class="s">&quot;infinity&quot;</span><span class="p p-Indicator">]</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Add container to networks</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleepy</span>
    <span class="nt">networks</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">TestingNet</span>
        <span class="nt">ipv4_address</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">172.1.1.18</span>
        <span class="nt">links</span><span class="p">:</span>
          <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">sleeper</span>
      <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">TestingNet2</span>
        <span class="nt">ipv4_address</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">172.1.10.20</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Update network with aliases</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleepy</span>
    <span class="nt">networks</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">TestingNet</span>
        <span class="nt">aliases</span><span class="p">:</span>
          <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">sleepyz</span>
          <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">zzzz</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Remove container from one network</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleepy</span>
    <span class="nt">networks</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">TestingNet2</span>
    <span class="nt">purge_networks</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">yes</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Remove container from all networks</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleepy</span>
    <span class="nt">purge_networks</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">yes</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Start a container and use an env file</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">agent</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">jenkinsci/ssh-slave</span>
    <span class="nt">env_file</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">/var/tmp/jenkins/agent.env</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Create a container with limited capabilities</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleepy</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:16.04</span>
    <span class="nt">command</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">sleep infinity</span>
    <span class="nt">capabilities</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">sys_time</span>
    <span class="nt">cap_drop</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">all</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Finer container restart/update control</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">test</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:18.04</span>
    <span class="nt">env</span><span class="p">:</span>
      <span class="nt">arg1</span><span class="p">:</span> <span class="s">&quot;true&quot;</span>
      <span class="nt">arg2</span><span class="p">:</span> <span class="s">&quot;whatever&quot;</span>
    <span class="nt">volumes</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">/tmp:/tmp</span>
    <span class="nt">comparisons</span><span class="p">:</span>
      <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ignore</span>   <span class="c1"># don&#39;t restart containers with older versions of the image</span>
      <span class="nt">env</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">strict</span>   <span class="c1"># we want precisely this environment</span>
      <span class="nt">volumes</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">allow_more_present</span>   <span class="c1"># if there are more volumes, that&#39;s ok, as long as `/tmp:/tmp` is there</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Finer container restart/update control II</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">test</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:18.04</span>
    <span class="nt">env</span><span class="p">:</span>
      <span class="nt">arg1</span><span class="p">:</span> <span class="s">&quot;true&quot;</span>
      <span class="nt">arg2</span><span class="p">:</span> <span class="s">&quot;whatever&quot;</span>
    <span class="nt">comparisons</span><span class="p">:</span>
      <span class="s">&#39;*&#39;</span><span class="p p-Indicator">:</span> <span class="l l-Scalar l-Scalar-Plain">ignore</span>  <span class="c1"># by default, ignore *all* options (including image)</span>
      <span class="nt">env</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">strict</span>   <span class="c1"># except for environment variables; there, we want to be strict</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Start container with healthstatus</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">nginx-proxy</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">nginx:1.13</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">started</span>
    <span class="nt">healthcheck</span><span class="p">:</span>
      <span class="c1"># Check if nginx server is healthy by curl&#39;ing the server.</span>
      <span class="c1"># If this fails or timeouts, the healthcheck fails.</span>
      <span class="nt">test</span><span class="p">:</span> <span class="p p-Indicator">[</span><span class="s">&quot;CMD&quot;</span><span class="p p-Indicator">,</span> <span class="s">&quot;curl&quot;</span><span class="p p-Indicator">,</span> <span class="s">&quot;--fail&quot;</span><span class="p p-Indicator">,</span> <span class="s">&quot;http://nginx.host.com&quot;</span><span class="p p-Indicator">]</span>
      <span class="nt">interval</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">1m30s</span>
      <span class="nt">timeout</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">10s</span>
      <span class="nt">retries</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">3</span>
      <span class="nt">start_period</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">30s</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Remove healthcheck from container</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">nginx-proxy</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">nginx:1.13</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">started</span>
    <span class="nt">healthcheck</span><span class="p">:</span>
      <span class="c1"># The &quot;NONE&quot; check needs to be specified</span>
      <span class="nt">test</span><span class="p">:</span> <span class="p p-Indicator">[</span><span class="s">&quot;NONE&quot;</span><span class="p p-Indicator">]</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Start container with block device read limit</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">test</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:18.04</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">started</span>
    <span class="nt">device_read_bps</span><span class="p">:</span>
      <span class="c1"># Limit read rate for /dev/sda to 20 mebibytes per second</span>
      <span class="p p-Indicator">-</span> <span class="nt">path</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">/dev/sda</span>
        <span class="nt">rate</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">20M</span>
    <span class="nt">device_read_iops</span><span class="p">:</span>
      <span class="c1"># Limit read rate for /dev/sdb to 300 IO per second</span>
      <span class="p p-Indicator">-</span> <span class="nt">path</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">/dev/sdb</span>
        <span class="nt">rate</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">300</span>

<span class="p p-Indicator">-</span> <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">Start container with GPUs</span>
  <span class="nt">community.general.docker_container</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">test</span>
    <span class="nt">image</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">ubuntu:18.04</span>
    <span class="nt">state</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">started</span>
    <span class="nt">device_requests</span><span class="p">:</span>
      <span class="p p-Indicator">-</span> <span class="c1"># Add some specific devices to this container</span>
        <span class="nt">device_ids</span><span class="p">:</span>
          <span class="p p-Indicator">-</span> <span class="s">&#39;0&#39;</span>
          <span class="p p-Indicator">-</span> <span class="s">&#39;GPU-3a23c669-1f69-c64e-cf85-44e9b07e7a2a&#39;</span>
      <span class="p p-Indicator">-</span> <span class="c1"># Add nVidia GPUs to this container</span>
        <span class="nt">driver</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">nvidia</span>
        <span class="nt">count</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">-1</span>  <span class="c1"># this means we want all</span>
        <span class="nt">capabilities</span><span class="p">:</span>
          <span class="c1"># We have one OR condition: &#39;gpu&#39; AND &#39;utility&#39;</span>
          <span class="p p-Indicator">-</span> <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">gpu</span>
            <span class="p p-Indicator">-</span> <span class="l l-Scalar l-Scalar-Plain">utility</span>
          <span class="c1"># See https://github.com/NVIDIA/nvidia-container-runtime#supported-driver-capabilities</span>
          <span class="c1"># for a list of capabilities supported by the nvidia driver</span>
</pre></div>
</div>
</div>
<div class="section" id="return-values">
<h2><a class="toc-backref" href="#id7">Return Values</a><a class="headerlink" href="#return-values" title="Permalink to this headline">¶</a></h2>
<p>Common return values are documented <a class="reference internal" href="../../../reference_appendices/common_return_values.html#common-return-values"><span class="std std-ref">here</span></a>, the following are the fields unique to this module:</p>
<table border=0 cellpadding=0 class="documentation-table">
    <tr>
        <th colspan="1">Key</th>
        <th>Returned</th>
        <th width="100%">Description</th>
    </tr>
                <tr>
                            <td colspan="1">
                <div class="ansibleOptionAnchor" id="return-container"></div>
                <b>container</b>
                <a class="ansibleOptionLink" href="#return-container" title="Permalink to this return value"></a>
                <div style="font-size: small">
                  <span style="color: purple">dictionary</span>
                                      </div>
                                </td>
            <td>always</td>
            <td>
                                        <div>Facts representing the current state of the container. Matches the docker inspection output.</div>
                                        <div>Note that facts are part of the registered vars since Ansible 2.8. For compatibility reasons, the facts are also accessible directly as <code>docker_container</code>. Note that the returned fact will be removed in community.general 2.0.0.</div>
                                        <div>Before 2.3 this was <code>ansible_docker_container</code> but was renamed in 2.3 to <code>docker_container</code> due to conflicts with the connection plugin.</div>
                                        <div>Empty if <em>state</em> is <code>absent</code></div>
                                        <div>If <em>detached</em> is <code>false</code>, will include <code>Output</code> attribute containing any output from container run.</div>
                                    <br/>
                                        <div style="font-size: smaller"><b>Sample:</b></div>
                                            <div style="font-size: smaller; color: blue; word-wrap: break-word; word-break: break-all;">{ &quot;AppArmorProfile&quot;: &quot;&quot;, &quot;Args&quot;: [], &quot;Config&quot;: { &quot;AttachStderr&quot;: false, &quot;AttachStdin&quot;: false, &quot;AttachStdout&quot;: false, &quot;Cmd&quot;: [ &quot;/usr/bin/supervisord&quot; ], &quot;Domainname&quot;: &quot;&quot;, &quot;Entrypoint&quot;: null, &quot;Env&quot;: [ &quot;PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot; ], &quot;ExposedPorts&quot;: { &quot;443/tcp&quot;: {}, &quot;80/tcp&quot;: {} }, &quot;Hostname&quot;: &quot;8e47bf643eb9&quot;, &quot;Image&quot;: &quot;lnmp_nginx:v1&quot;, &quot;Labels&quot;: {}, &quot;OnBuild&quot;: null, &quot;OpenStdin&quot;: false, &quot;StdinOnce&quot;: false, &quot;Tty&quot;: false, &quot;User&quot;: &quot;&quot;, &quot;Volumes&quot;: { &quot;/tmp/lnmp/nginx-sites/logs/&quot;: {} }, ... }</div>
                                </td>
        </tr>
                    </table>
<br/><br/><div class="section" id="authors">
<h3>Authors<a class="headerlink" href="#authors" title="Permalink to this headline">¶</a></h3>
<ul class="simple">
<li><p>Cove Schneider (&#64;cove)</p></li>
<li><p>Joshua Conner (&#64;joshuaconner)</p></li>
<li><p>Pavel Antonov (&#64;softzilla)</p></li>
<li><p>Thomas Steinbach (&#64;ThomasSteinbach)</p></li>
<li><p>Philippe Jandot (&#64;zfil)</p></li>
<li><p>Daan Oosterveld (&#64;dusdanig)</p></li>
<li><p>Chris Houseknecht (&#64;chouseknecht)</p></li>
<li><p>Kassian Sun (&#64;kassiansun)</p></li>
<li><p>Felix Fontein (&#64;felixfontein)</p></li>
</ul>
</div>
</div>
</div>


           </div>
           
          </div>
          <footer>
  

  <hr/>


<script type="text/javascript">
  (function(w,d,t,u,n,s,e){w['SwiftypeObject']=n;w[n]=w[n]||function(){
  (w[n].q=w[n].q||[]).push(arguments);};s=d.createElement(t);
  e=d.getElementsByTagName(t)[0];s.async=1;s.src=u;e.parentNode.insertBefore(s,e);
  })(window,document,'script','//s.swiftypecdn.com/install/v2/st.js','_st');

  _st('install','yABGvz2N8PwcwBxyfzUc','2.0.0');
</script>

  <div role="contentinfo">
    <p>
        &copy; Copyright 2019 Red Hat, Inc.
      <span class="lastupdated">
        Last updated on Dec 02, 2020.
      </span>

    </p>
  </div> 
</footer>
        </div>
      </div>

    </section>

  </div>

  <script type="text/javascript">
      jQuery(function () {
          
          SphinxRtdTheme.Navigation.enableSticky();
          
      });
  </script>

  
  
    
   <!-- extra footer elements for Ansible beyond RTD Sphinx Theme --->
<!-- begin analytics -->
<script type="text/javascript">
var _hsq = _hsq || [];
_hsq.push(["setContentType", "standard-page"]);
      (function(d,s,i,r) {
      if (d.getElementById(i)){return;}
      var n = d.createElement(s),e = document.getElementsByTagName(s)[0];
      n.id=i;n.src = '//js.hs-analytics.net/analytics/'+(Math.ceil(new Date()/r)*r)+'/330046.js';
      e.parentNode.insertBefore(n, e);
      })(document, "script", "hs-analytics",300000);
</script>
<!-- end analytics -->
<script type="text/javascript">
if (("undefined" !== typeof _satellite) && ("function" === typeof _satellite.pageBottom)) {
  _satellite.pageBottom();
}
</script> 

</body>
</html>