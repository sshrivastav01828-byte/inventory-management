<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Inventory Management System">
  <meta name="author" content="InvenTrack">
  <title>InvenTrack - Inventory Management System</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
    body { background-color: #f5f5f5; padding-top: 60px; font-family: 'Segoe UI', Arial, sans-serif; }

    /* ── Navbar ── */
    .navbar-inverse { background-color: #1a237e; border-color: #1a237e; }
    .navbar-inverse .navbar-brand { color: #fff; font-weight: 700; font-size: 20px; }
    .navbar-inverse .navbar-nav > li > a { color: #ccc; }
    .navbar-inverse .navbar-nav > li > a:hover { color: #fff; background-color: #283593; }
    .navbar-brand .fa { margin-right: 8px; }

    /* ── Stats Cards ── */
    .stat-card { border-radius: 6px; padding: 20px; color: #fff; margin-bottom: 20px; text-align: center; }
    .stat-card .stat-number { font-size: 36px; font-weight: 700; }
    .stat-card .stat-label  { font-size: 14px; opacity: 0.9; margin-top: 4px; }
    .stat-card .fa          { font-size: 40px; opacity: 0.3; float: right; margin-top: -10px; }
    .card-blue   { background-color: #1565C0; }
    .card-green  { background-color: #2E7D32; }
    .card-orange { background-color: #E65100; }
    .card-red    { background-color: #B71C1C; }

    /* ── Section Panels ── */
    .section-panel { display: none; }
    .section-panel.active { display: block; }
    .panel { border-radius: 6px; }
    .panel-heading { font-weight: 600; font-size: 15px; }
    .panel-primary > .panel-heading { background-color: #1a237e; border-color: #1a237e; }

    /* ── Table ── */
    .table > thead > tr > th { background-color: #e8eaf6; color: #1a237e; font-weight: 600; border-bottom: 2px solid #9fa8da; }
    .table > tbody > tr:hover { background-color: #f3f4ff; }
    .table-responsive { border-radius: 4px; }

    /* ── Badges ── */
    .badge-in     { background-color: #2E7D32; color:#fff; padding: 3px 8px; border-radius: 10px; font-size:11px; }
    .badge-low    { background-color: #E65100; color:#fff; padding: 3px 8px; border-radius: 10px; font-size:11px; }
    .badge-out    { background-color: #B71C1C; color:#fff; padding: 3px 8px; border-radius: 10px; font-size:11px; }

    /* ── Buttons ── */
    .btn-action { margin: 1px; padding: 3px 8px; font-size: 12px; }
    .btn-sidebar { width:100%; text-align:left; margin-bottom:4px; border-radius:4px; }
    .btn-sidebar .fa { margin-right:8px; width:16px; }
    .btn-sidebar.active { background-color:#1a237e; color:#fff; border-color:#1a237e; }

    /* ── Sidebar ── */
    .sidebar { background: #fff; border-radius:6px; padding:16px; box-shadow:0 1px 4px rgba(0,0,0,0.08); margin-bottom:20px; }
    .sidebar h5 { color:#1a237e; font-weight:700; text-transform:uppercase; font-size:11px; letter-spacing:.08em; border-bottom:1px solid #e8eaf6; padding-bottom:8px; margin-bottom:12px; }

    /* ── Forms ── */
    .form-control:focus { border-color:#3949ab; box-shadow: 0 0 0 2px rgba(57,73,171,0.2); }
    label { font-weight:600; font-size:13px; }

    /* ── Alert banners ── */
    .alert-low-stock { background-color:#fff3e0; border-left:4px solid #E65100; color:#BF360C; padding:10px 14px; border-radius:4px; margin-bottom:8px; }
    .alert-out-stock { background-color:#ffebee; border-left:4px solid #B71C1C; color:#7F0000; padding:10px 14px; border-radius:4px; margin-bottom:8px; }

    /* ── Footer ── */
    footer { margin-top:40px; padding:20px 0; border-top:1px solid #dee2e6; color:#888; text-align:center; font-size:13px; }

    /* ── Modal ── */
    .modal-header { background-color:#1a237e; color:#fff; border-radius:4px 4px 0 0; }
    .modal-title { font-weight:700; }

    /* ── Toast ── */
    #toast { position:fixed; bottom:30px; right:30px; min-width:220px; z-index:9999; display:none; }

    /* ── Category pill ── */
    .cat-pill { background:#e8eaf6; color:#3949ab; padding:2px 8px; border-radius:10px; font-size:11px; }
  </style>
</head>
<body>

<!-- ── NAVBAR ──────────────────────────────────────────────── -->
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><i class="fa fa-cubes"></i> InvenTrack</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li><a href="#" onclick="showSection('dashboard')"><i class="fa fa-dashboard"></i> Dashboard</a></li>
        <li><a href="#" onclick="showSection('products')"><i class="fa fa-list"></i> Products</a></li>
        <li><a href="#" onclick="showSection('stock')"><i class="fa fa-exchange"></i> Stock Update</a></li>
        <li><a href="#" onclick="showSection('alerts')"><i class="fa fa-bell"></i> Alerts <span id="nav-badge" class="badge" style="background:#E65100;display:none"></span></a></li>
        <li><a href="#" onclick="showSection('reports')"><i class="fa fa-bar-chart"></i> Reports</a></li>
        <li><a href="#" onclick="showSection('search')"><i class="fa fa-search"></i> Search</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" onclick="exportCSV()"><i class="fa fa-download"></i> Export CSV</a></li>
        <li><a href="#" onclick="openAddModal()"><i class="fa fa-plus"></i> Add Product</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid" style="padding:0 24px;">

<!-- ═══════════════════════════════════════════════════════════
     SECTION 1 — DASHBOARD
════════════════════════════════════════════════════════════ -->
<div id="sec-dashboard" class="section-panel active">
  <h3 style="color:#1a237e; margin-bottom:20px;"><i class="fa fa-dashboard"></i> Dashboard</h3>

  <!-- Stat Cards -->
  <div class="row" id="stat-row"></div>

  <!-- Recent Products + Category Breakdown -->
  <div class="row">
    <div class="col-md-8">
      <div class="panel panel-primary">
        <div class="panel-heading"><i class="fa fa-clock-o"></i> Recently Added Products</div>
        <div class="panel-body" style="padding:0;">
          <div class="table-responsive">
            <table class="table table-bordered table-hover" style="margin:0;">
              <thead><tr><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Status</th></tr></thead>
              <tbody id="recent-tbody"></tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="panel panel-primary">
        <div class="panel-heading"><i class="fa fa-pie-chart"></i> Stock by Category</div>
        <div class="panel-body" id="cat-breakdown"></div>
      </div>
    </div>
  </div>
</div>

<!-- ═══════════════════════════════════════════════════════════
     SECTION 2 — ALL PRODUCTS
════════════════════════════════════════════════════════════ -->
<div id="sec-products" class="section-panel">
  <div class="row" style="margin-bottom:14px;">
    <div class="col-md-6"><h3 style="color:#1a237e; margin:0;"><i class="fa fa-list"></i> All Products</h3></div>
    <div class="col-md-6">
      <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-search"></i></span>
        <input type="text" class="form-control" id="prod-filter" placeholder="Filter by name, category, SKU..." oninput="filterProducts(this.value)">
      </div>
    </div>
  </div>
  <div class="panel panel-primary">
    <div class="panel-body" style="padding:0;">
      <div class="table-responsive">
        <table class="table table-bordered table-hover" style="margin:0;">
          <thead>
            <tr>
              <th>#</th><th>ID</th><th>Name</th><th>Category</th>
              <th>Price (&#8377;)</th><th>Stock</th><th>Threshold</th>
              <th>Status</th><th>Value (&#8377;)</th><th>Actions</th>
            </tr>
          </thead>
          <tbody id="products-tbody"></tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<!-- ═══════════════════════════════════════════════════════════
     SECTION 3 — STOCK UPDATE
════════════════════════════════════════════════════════════ -->
<div id="sec-stock" class="section-panel">
  <h3 style="color:#1a237e; margin-bottom:20px;"><i class="fa fa-exchange"></i> Stock Update</h3>
  <div class="row">
    <div class="col-md-5">
      <div class="panel panel-primary">
        <div class="panel-heading">Update Stock Level</div>
        <div class="panel-body">
          <div class="form-group">
            <label>Select Product</label>
            <select class="form-control" id="st-product" onchange="onStockSelect()">
              <option value="">-- Choose a product --</option>
            </select>
          </div>
          <div id="st-current" class="alert alert-info" style="display:none; padding:8px 12px; font-size:13px;"></div>
          <div class="form-group">
            <label>Action</label>
            <select class="form-control" id="st-action">
              <option value="add">Add Stock (Restock)</option>
              <option value="remove">Remove Stock (Sold / Damaged)</option>
              <option value="set">Set Exact Stock Level</option>
            </select>
          </div>
          <div class="form-group">
            <label>Quantity</label>
            <input type="number" class="form-control" id="st-qty" min="0" placeholder="Enter quantity">
          </div>
          <div class="form-group">
            <label>Note <small class="text-muted">(optional)</small></label>
            <input type="text" class="form-control" id="st-note" placeholder="e.g. Monthly restock, Damaged items...">
          </div>
          <button class="btn btn-primary btn-block" onclick="submitStock()">
            <i class="fa fa-check"></i> Update Stock
          </button>
        </div>
      </div>
    </div>
    <div class="col-md-7">
      <div class="panel panel-primary">
        <div class="panel-heading"><i class="fa fa-history"></i> Stock History</div>
        <div class="panel-body" style="padding:0; max-height:420px; overflow-y:auto;">
          <div id="stock-history" style="padding:12px;"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- ═══════════════════════════════════════════════════════════
     SECTION 4 — LOW STOCK ALERTS
════════════════════════════════════════════════════════════ -->
<div id="sec-alerts" class="section-panel">
  <h3 style="color:#1a237e; margin-bottom:20px;"><i class="fa fa-bell"></i> Low Stock Alerts</h3>
  <div id="alerts-body"></div>
</div>

<!-- ═══════════════════════════════════════════════════════════
     SECTION 5 — REPORTS
════════════════════════════════════════════════════════════ -->
<div id="sec-reports" class="section-panel">
  <h3 style="color:#1a237e; margin-bottom:20px;"><i class="fa fa-bar-chart"></i> Inventory Reports</h3>
  <div id="reports-body"></div>
</div>

<!-- ═══════════════════════════════════════════════════════════
     SECTION 6 — SEARCH
════════════════════════════════════════════════════════════ -->
<div id="sec-search" class="section-panel">
  <h3 style="color:#1a237e; margin-bottom:20px;"><i class="fa fa-search"></i> Search Products</h3>
  <div class="panel panel-primary">
    <div class="panel-heading">Search Filters</div>
    <div class="panel-body">
      <div class="row">
        <div class="col-md-3">
          <div class="form-group">
            <label>Keyword</label>
            <input type="text" class="form-control" id="s-kw" placeholder="Name, SKU, ID...">
          </div>
        </div>
        <div class="col-md-2">
          <div class="form-group">
            <label>Category</label>
            <select class="form-control" id="s-cat">
              <option value="">All Categories</option>
            </select>
          </div>
        </div>
        <div class="col-md-2">
          <div class="form-group">
            <label>Min Price (&#8377;)</label>
            <input type="number" class="form-control" id="s-min" placeholder="0">
          </div>
        </div>
        <div class="col-md-2">
          <div class="form-group">
            <label>Max Price (&#8377;)</label>
            <input type="number" class="form-control" id="s-max" placeholder="99999">
          </div>
        </div>
        <div class="col-md-2">
          <div class="form-group">
            <label>Status</label>
            <select class="form-control" id="s-status">
              <option value="">All</option>
              <option value="in">In Stock</option>
              <option value="low">Low Stock</option>
              <option value="out">Out of Stock</option>
            </select>
          </div>
        </div>
        <div class="col-md-1">
          <div class="form-group">
            <label>&nbsp;</label>
            <button class="btn btn-primary btn-block" onclick="runSearch()">
              <i class="fa fa-search"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="panel panel-primary">
    <div class="panel-heading">Search Results <span id="s-count" class="badge" style="background:#fff; color:#1a237e;"></span></div>
    <div class="panel-body" style="padding:0;">
      <div class="table-responsive">
        <table class="table table-bordered table-hover" style="margin:0;">
          <thead><tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Status</th></tr></thead>
          <tbody id="s-tbody"><tr><td colspan="6" class="text-center text-muted" style="padding:20px;">Enter search criteria above and click Search</td></tr></tbody>
        </table>
      </div>
    </div>
  </div>
</div>

</div><!-- /container-fluid -->

<!-- ── FOOTER ── -->
<footer>
  <div class="container">
    <p><strong>InvenTrack</strong> &mdash; Inventory Management System &copy; 2024 &nbsp;|&nbsp;
    Built with Maven &nbsp;&bull;&nbsp; Deployed via Jenkins &nbsp;&bull;&nbsp; Hosted on Apache Tomcat</p>
  </div>
</footer>

<!-- ═══════════════════════════════════════════════════════════
     ADD / EDIT PRODUCT MODAL
════════════════════════════════════════════════════════════ -->
<div class="modal fade" id="productModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" style="color:#fff;opacity:1;">&times;</button>
        <h4 class="modal-title" id="modal-title">Add Product</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="edit-id">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label>Product Name <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="f-name" placeholder="e.g. Wireless Mouse">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label>Category <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="f-cat" placeholder="e.g. Electronics" list="cat-datalist">
              <datalist id="cat-datalist"></datalist>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label>Price (&#8377;) <span class="text-danger">*</span></label>
              <input type="number" class="form-control" id="f-price" min="0" placeholder="0.00">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label>Stock Quantity <span class="text-danger">*</span></label>
              <input type="number" class="form-control" id="f-stock" min="0" placeholder="0">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <label>Low Stock Threshold</label>
              <input type="number" class="form-control" id="f-threshold" min="0" value="10">
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <label>SKU / Code</label>
              <input type="text" class="form-control" id="f-sku" placeholder="e.g. EL-001">
            </div>
          </div>
        </div>
        <div class="form-group">
          <label>Description</label>
          <textarea class="form-control" id="f-desc" rows="2" placeholder="Short product description..."></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary" onclick="saveProduct()">
          <i class="fa fa-check"></i> Save Product
        </button>
      </div>
    </div>
  </div>
</div>

<!-- ── DELETE CONFIRM MODAL ── -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background:#B71C1C;">
        <h4 class="modal-title">Confirm Delete</h4>
      </div>
      <div class="modal-body">
        <p>Delete <strong id="del-name"></strong>?</p>
        <p class="text-danger"><small>This action cannot be undone.</small></p>
      </div>
      <div class="modal-footer">
        <button class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button class="btn btn-danger" onclick="confirmDelete()"><i class="fa fa-trash"></i> Delete</button>
      </div>
    </div>
  </div>
</div>

<!-- ── TOAST ── -->
<div id="toast" class="alert" role="alert"></div>

<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
// ============================================================
//  InvenTrack - Inventory Management System
//  JSP + Bootstrap 3 version (Tomcat WAR deployment)
//  Data stored in localStorage (no backend needed)
// ============================================================

// ── Data Store ───────────────────────────────────────────────
var products = JSON.parse(localStorage.getItem('inv_products') || '[]');
var history  = JSON.parse(localStorage.getItem('inv_history')  || '[]');
var deleteId = null;

function saveData() {
  localStorage.setItem('inv_products', JSON.stringify(products));
  localStorage.setItem('inv_history',  JSON.stringify(history));
}

// ── Seed sample data on first visit ──────────────────────────
if (products.length === 0) {
  var seed = [
    {id:'P0001', name:'Wireless Mouse',       category:'Electronics', price:899,   stock:45,  threshold:10, sku:'EL-001', desc:'Bluetooth wireless mouse'},
    {id:'P0002', name:'USB-C Hub 7-in-1',     category:'Electronics', price:1499,  stock:8,   threshold:10, sku:'EL-002', desc:'7-in-1 USB-C hub'},
    {id:'P0003', name:'Mechanical Keyboard',  category:'Electronics', price:3499,  stock:0,   threshold:5,  sku:'EL-003', desc:'TKL mechanical keyboard'},
    {id:'P0004', name:'27 inch Monitor',      category:'Electronics', price:18999, stock:6,   threshold:3,  sku:'EL-004', desc:'4K IPS display'},
    {id:'P0005', name:'Laptop Stand',         category:'Electronics', price:1299,  stock:22,  threshold:8,  sku:'EL-005', desc:'Aluminium laptop stand'},
    {id:'P0006', name:'A4 Ruled Notebook',    category:'Stationery',  price:120,   stock:200, threshold:30, sku:'ST-001', desc:'200-page notebook'},
    {id:'P0007', name:'Ball Pen Pack',        category:'Stationery',  price:75,    stock:4,   threshold:20, sku:'ST-002', desc:'Pack of 10 blue pens'},
    {id:'P0008', name:'Sticky Notes',         category:'Stationery',  price:60,    stock:85,  threshold:15, sku:'ST-003', desc:'Post-it style notes'},
    {id:'P0009', name:'Ergonomic Chair',      category:'Furniture',   price:8999,  stock:12,  threshold:3,  sku:'FU-001', desc:'Mesh back chair'},
    {id:'P0010', name:'Standing Desk',        category:'Furniture',   price:14999, stock:2,   threshold:2,  sku:'FU-002', desc:'Height-adjustable desk'},
    {id:'P0011', name:'Hand Sanitizer 500ml', category:'Consumables', price:89,    stock:150, threshold:50, sku:'CO-001', desc:'70% alcohol sanitizer'},
    {id:'P0012', name:'Printer Paper A4',     category:'Consumables', price:350,   stock:9,   threshold:10, sku:'CO-002', desc:'A4 80gsm 500 sheets'},
    {id:'P0013', name:'Wi-Fi Router',         category:'Networking',  price:4499,  stock:0,   threshold:3,  sku:'NW-001', desc:'Dual-band AC1200 router'},
    {id:'P0014', name:'Cat6 Cable 10m',       category:'Networking',  price:299,   stock:40,  threshold:10, sku:'NW-002', desc:'Cat6 ethernet cable'},
  ];
  products = seed;
  saveData();
}

// ── Helpers ──────────────────────────────────────────────────
function nextId() {
  var max = 0;
  products.forEach(function(p){ var n = parseInt(p.id.replace('P',''));if(n>max)max=n; });
  return 'P' + String(max + 1).padStart(4, '0');
}

function getStatus(p) {
  if (p.stock === 0)            return {key:'out', label:'Out of Stock', cls:'badge-out'};
  if (p.stock <= p.threshold)   return {key:'low', label:'Low Stock',    cls:'badge-low'};
  return                               {key:'in',  label:'In Stock',     cls:'badge-in'};
}

function fmtPrice(n) {
  return Number(n).toLocaleString('en-IN', {maximumFractionDigits:0});
}

function showToast(msg, type) {
  var el = document.getElementById('toast');
  el.className = 'alert alert-' + (type || 'success');
  el.innerHTML = '<i class="fa fa-' + (type==='danger'?'times':type==='warning'?'exclamation-triangle':'check') + '"></i> ' + msg;
  el.style.display = 'block';
  setTimeout(function(){ el.style.display = 'none'; }, 3000);
}

function getLowStockProducts() {
  return products.filter(function(p){ return getStatus(p).key !== 'in'; });
}

function updateNavBadge() {
  var n = getLowStockProducts().length;
  var b = document.getElementById('nav-badge');
  b.style.display = n > 0 ? 'inline' : 'none';
  b.textContent = n;
}

function getCategories() {
  var cats = [];
  products.forEach(function(p){ if(cats.indexOf(p.category)<0) cats.push(p.category); });
  return cats.sort();
}

// ── Navigation ────────────────────────────────────────────────
function showSection(name) {
  ['dashboard','products','stock','alerts','reports','search'].forEach(function(s){
    document.getElementById('sec-' + s).classList.remove('active');
  });
  document.getElementById('sec-' + name).classList.add('active');
  var renders = {
    dashboard: renderDashboard,
    products:  renderProducts,
    stock:     renderStock,
    alerts:    renderAlerts,
    reports:   renderReports,
    search:    renderSearch
  };
  if (renders[name]) renders[name]();
  return false;
}

// ── Dashboard ─────────────────────────────────────────────────
function renderDashboard() {
  var total = products.length;
  var totalVal = products.reduce(function(s,p){ return s + p.price*p.stock; }, 0);
  var lowCnt = getLowStockProducts().length;
  var outCnt = products.filter(function(p){ return p.stock===0; }).length;

  document.getElementById('stat-row').innerHTML =
    statCard('Total Products', total, 'cubes', 'card-blue', 'Categories: ' + getCategories().length) +
    statCard('Inventory Value', '&#8377;' + fmtPrice(totalVal), 'inr', 'card-green', 'Total stock value') +
    statCard('Low Stock', lowCnt, 'exclamation-triangle', 'card-orange', 'Need attention') +
    statCard('Out of Stock', outCnt, 'times-circle', 'card-red', 'Zero inventory');

  // Recent products (last 5)
  var recent = products.slice().reverse().slice(0,5);
  document.getElementById('recent-tbody').innerHTML = recent.map(function(p){
    var s = getStatus(p);
    return '<tr><td><strong>' + p.name + '</strong></td>' +
           '<td><span class="cat-pill">' + p.category + '</span></td>' +
           '<td>&#8377;' + fmtPrice(p.price) + '</td>' +
           '<td>' + p.stock + '</td>' +
           '<td><span class="' + s.cls + '">' + s.label + '</span></td></tr>';
  }).join('');

  // Category breakdown
  var cats = {};
  products.forEach(function(p){
    if(!cats[p.category]) cats[p.category]={count:0,stock:0,value:0};
    cats[p.category].count++;
    cats[p.category].stock += p.stock;
    cats[p.category].value += p.price * p.stock;
  });
  var maxVal = Math.max.apply(null, Object.values(cats).map(function(d){return d.count;})) || 1;
  var colors = ['#1565C0','#2E7D32','#E65100','#6A1B9A','#B71C1C'];
  var ci = 0;
  document.getElementById('cat-breakdown').innerHTML = Object.keys(cats).sort().map(function(cat){
    var d = cats[cat]; var pct = Math.round(d.count/maxVal*100); var col = colors[ci++%colors.length];
    return '<div style="margin-bottom:14px;">' +
      '<div style="display:flex;justify-content:space-between;margin-bottom:3px;">' +
      '<strong style="font-size:13px;">' + cat + '</strong>' +
      '<small class="text-muted">' + d.count + ' items &bull; &#8377;' + fmtPrice(d.value) + '</small></div>' +
      '<div class="progress" style="height:8px;margin:0;">' +
      '<div class="progress-bar" style="width:' + pct + '%;background:' + col + ';"></div></div></div>';
  }).join('');

  updateNavBadge();
}

function statCard(label, value, icon, cls, sub) {
  return '<div class="col-md-3 col-sm-6"><div class="stat-card ' + cls + '">' +
    '<i class="fa fa-' + icon + '"></i>' +
    '<div class="stat-number">' + value + '</div>' +
    '<div class="stat-label">' + label + '</div>' +
    '<small style="opacity:.7;">' + sub + '</small></div></div>';
}

// ── Products Table ────────────────────────────────────────────
function renderProducts() {
  renderProductsTable(products);
  refreshCatDatalist();
}

function renderProductsTable(list) {
  if (list.length === 0) {
    document.getElementById('products-tbody').innerHTML =
      '<tr><td colspan="10" class="text-center text-muted" style="padding:30px;">No products found.</td></tr>';
    return;
  }
  document.getElementById('products-tbody').innerHTML = list.map(function(p, i){
    var s = getStatus(p);
    return '<tr>' +
      '<td>' + (i+1) + '</td>' +
      '<td><small class="text-muted">' + p.id + '</small></td>' +
      '<td><strong>' + p.name + '</strong><br><small class="text-muted">' + (p.sku||'') + '</small></td>' +
      '<td><span class="cat-pill">' + p.category + '</span></td>' +
      '<td>&#8377;' + fmtPrice(p.price) + '</td>' +
      '<td><strong>' + p.stock + '</strong></td>' +
      '<td>' + p.threshold + '</td>' +
      '<td><span class="' + s.cls + '">' + s.label + '</span></td>' +
      '<td>&#8377;' + fmtPrice(p.price * p.stock) + '</td>' +
      '<td>' +
        '<button class="btn btn-xs btn-primary btn-action" onclick="openEditModal(\'' + p.id + '\')"><i class="fa fa-edit"></i></button> ' +
        '<button class="btn btn-xs btn-danger btn-action" onclick="openDeleteModal(\'' + p.id + '\',\'' + p.name.replace(/'/g,"\\'") + '\')"><i class="fa fa-trash"></i></button>' +
      '</td></tr>';
  }).join('');
}

function filterProducts(q) {
  var filtered = products.filter(function(p){
    var kw = q.toLowerCase();
    return !kw || p.name.toLowerCase().includes(kw) || p.category.toLowerCase().includes(kw) || (p.sku||'').toLowerCase().includes(kw);
  });
  renderProductsTable(filtered);
}

function refreshCatDatalist() {
  var cats = getCategories();
  document.getElementById('cat-datalist').innerHTML = cats.map(function(c){ return '<option value="' + c + '">'; }).join('');
  var sel = document.getElementById('s-cat');
  if (sel) sel.innerHTML = '<option value="">All Categories</option>' + cats.map(function(c){ return '<option>' + c + '</option>'; }).join('');
}

// ── Stock Update ──────────────────────────────────────────────
function renderStock() {
  var sel = document.getElementById('st-product');
  sel.innerHTML = '<option value="">-- Choose a product --</option>' +
    products.map(function(p){ return '<option value="' + p.id + '">' + p.name + ' (stock: ' + p.stock + ')</option>'; }).join('');
  renderStockHistory();
}

function onStockSelect() {
  var id = document.getElementById('st-product').value;
  var el = document.getElementById('st-current');
  if (!id) { el.style.display='none'; return; }
  var p = products.find(function(x){ return x.id===id; });
  if (p) { el.style.display='block'; el.innerHTML='<i class="fa fa-info-circle"></i> Current stock: <strong>' + p.stock + '</strong> units &nbsp;|&nbsp; Threshold: ' + p.threshold; }
}

function submitStock() {
  var id  = document.getElementById('st-product').value;
  var act = document.getElementById('st-action').value;
  var qty = parseInt(document.getElementById('st-qty').value);
  var note= document.getElementById('st-note').value;
  if (!id)  return showToast('Please select a product', 'warning');
  if (isNaN(qty)||qty<0) return showToast('Enter a valid quantity', 'warning');

  var p = products.find(function(x){ return x.id===id; });
  var before = p.stock;
  if (act==='add')    p.stock = before + qty;
  if (act==='remove') p.stock = Math.max(0, before - qty);
  if (act==='set')    p.stock = qty;

  history.unshift({ id:id, name:p.name, action:act, qty:qty, before:before, after:p.stock, note:note, ts:new Date().toLocaleString() });
  history = history.slice(0,100);
  saveData();
  showToast('Stock updated for ' + p.name, 'success');
  document.getElementById('st-qty').value = '';
  document.getElementById('st-note').value = '';
  renderStock();
  updateNavBadge();
}

function renderStockHistory() {
  var el = document.getElementById('stock-history');
  if (history.length===0) { el.innerHTML='<p class="text-muted text-center">No stock changes yet.</p>'; return; }
  var colors = {add:'#2E7D32', remove:'#B71C1C', set:'#1565C0'};
  var labels = {add:'Added', remove:'Removed', set:'Set to'};
  el.innerHTML = history.map(function(e){
    return '<div style="border:1px solid #e8eaf6;border-radius:4px;padding:10px 12px;margin-bottom:8px;">' +
      '<div style="display:flex;justify-content:space-between;">' +
      '<strong>' + e.name + '</strong><small class="text-muted">' + e.ts + '</small></div>' +
      '<div style="font-size:12px;color:#666;margin-top:3px;">' +
      '<span style="color:' + colors[e.action] + ';font-weight:600;">' + labels[e.action] + ' ' + e.qty + '</span>' +
      ' &nbsp;|&nbsp; Before: ' + e.before + ' &rarr; After: <strong>' + e.after + '</strong>' +
      (e.note ? ' &nbsp;|&nbsp; &ldquo;' + e.note + '&rdquo;' : '') + '</div></div>';
  }).join('');
}

// ── Alerts ────────────────────────────────────────────────────
function renderAlerts() {
  var low = getLowStockProducts();
  var el = document.getElementById('alerts-body');
  if (low.length===0) {
    el.innerHTML = '<div class="alert alert-success"><i class="fa fa-check-circle fa-lg"></i> &nbsp;All products are adequately stocked! No alerts at this time.</div>';
    return;
  }
  var out  = low.filter(function(p){ return p.stock===0; });
  var warn = low.filter(function(p){ return p.stock>0; });
  var html = '';

  if (out.length) {
    html += '<div class="panel panel-danger"><div class="panel-heading"><i class="fa fa-times-circle"></i> Out of Stock (' + out.length + ')</div>' +
      '<div class="panel-body" style="padding:0;"><div class="table-responsive"><table class="table table-bordered table-hover" style="margin:0;">' +
      '<thead><tr><th>Product</th><th>Category</th><th>Price</th><th>Threshold</th><th>Action</th></tr></thead><tbody>' +
      out.map(function(p){
        return '<tr class="danger"><td><strong>' + p.name + '</strong><br><small>' + p.id + '</small></td>' +
               '<td><span class="cat-pill">' + p.category + '</span></td>' +
               '<td>&#8377;' + fmtPrice(p.price) + '</td><td>' + p.threshold + '</td>' +
               '<td><button class="btn btn-xs btn-warning" onclick="showSection(\'stock\')"><i class="fa fa-refresh"></i> Restock</button></td></tr>';
      }).join('') + '</tbody></table></div></div></div>';
  }

  if (warn.length) {
    html += '<div class="panel panel-warning"><div class="panel-heading"><i class="fa fa-exclamation-triangle"></i> Low Stock (' + warn.length + ')</div>' +
      '<div class="panel-body" style="padding:0;"><div class="table-responsive"><table class="table table-bordered table-hover" style="margin:0;">' +
      '<thead><tr><th>Product</th><th>Category</th><th>Current</th><th>Threshold</th><th>Shortage</th><th>Action</th></tr></thead><tbody>' +
      warn.map(function(p){
        return '<tr class="warning"><td><strong>' + p.name + '</strong><br><small>' + p.id + '</small></td>' +
               '<td><span class="cat-pill">' + p.category + '</span></td>' +
               '<td><strong>' + p.stock + '</strong></td><td>' + p.threshold + '</td>' +
               '<td><span class="badge" style="background:#E65100;">' + (p.threshold-p.stock) + ' needed</span></td>' +
               '<td><button class="btn btn-xs btn-primary" onclick="showSection(\'stock\')"><i class="fa fa-refresh"></i> Restock</button></td></tr>';
      }).join('') + '</tbody></table></div></div></div>';
  }
  el.innerHTML = html;
}

// ── Reports ───────────────────────────────────────────────────
function renderReports() {
  var total    = products.length;
  var totalVal = products.reduce(function(s,p){ return s + p.price*p.stock; }, 0);
  var lowCnt   = getLowStockProducts().length;
  var cats     = {};
  products.forEach(function(p){
    if(!cats[p.category]) cats[p.category]={count:0,stock:0,value:0};
    cats[p.category].count++; cats[p.category].stock+=p.stock; cats[p.category].value+=p.price*p.stock;
  });
  var sorted = products.slice().sort(function(a,b){ return (b.price*b.stock)-(a.price*a.stock); });

  document.getElementById('reports-body').innerHTML =
    '<div class="row">' +
      statCard('Total Products', total, 'cubes', 'card-blue', 'In inventory') +
      statCard('Total Value', '&#8377;'+fmtPrice(totalVal), 'inr', 'card-green', 'Stock value') +
      statCard('Categories', getCategories().length, 'tags', 'card-orange', 'Product types') +
      statCard('Alerts', lowCnt, 'bell', 'card-red', 'Low / out of stock') +
    '</div>' +

    '<div class="row"><div class="col-md-6">' +
    '<div class="panel panel-primary"><div class="panel-heading"><i class="fa fa-tags"></i> Category Report</div>' +
    '<div class="panel-body" style="padding:0;"><div class="table-responsive"><table class="table table-bordered" style="margin:0;">' +
    '<thead><tr><th>Category</th><th>Products</th><th>Total Stock</th><th>Total Value</th></tr></thead><tbody>' +
    Object.keys(cats).sort().map(function(cat){
      var d=cats[cat];
      return '<tr><td><span class="cat-pill">'+cat+'</span></td><td>'+d.count+'</td><td>'+d.stock+'</td><td>&#8377;'+fmtPrice(d.value)+'</td></tr>';
    }).join('') + '</tbody></table></div></div></div></div>' +

    '<div class="col-md-6"><div class="panel panel-primary"><div class="panel-heading"><i class="fa fa-trophy"></i> Top 5 Products by Value</div>' +
    '<div class="panel-body" style="padding:0;"><div class="table-responsive"><table class="table table-bordered" style="margin:0;">' +
    '<thead><tr><th>Product</th><th>Stock</th><th>Value</th></tr></thead><tbody>' +
    sorted.slice(0,5).map(function(p){
      return '<tr><td><strong>'+p.name+'</strong></td><td>'+p.stock+'</td><td>&#8377;'+fmtPrice(p.price*p.stock)+'</td></tr>';
    }).join('') + '</tbody></table></div></div></div></div></div>' +

    '<div class="panel panel-primary"><div class="panel-heading"><i class="fa fa-table"></i> Full Inventory Report &nbsp;' +
    '<button class="btn btn-xs btn-default" onclick="exportCSV()"><i class="fa fa-download"></i> Export CSV</button></div>' +
    '<div class="panel-body" style="padding:0;"><div class="table-responsive"><table class="table table-bordered table-hover table-striped" style="margin:0;">' +
    '<thead><tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Threshold</th><th>Status</th><th>Value</th></tr></thead><tbody>' +
    products.map(function(p){
      var s=getStatus(p);
      return '<tr><td><small>'+p.id+'</small></td><td><strong>'+p.name+'</strong></td>' +
        '<td><span class="cat-pill">'+p.category+'</span></td>' +
        '<td>&#8377;'+fmtPrice(p.price)+'</td><td>'+p.stock+'</td><td>'+p.threshold+'</td>' +
        '<td><span class="'+s.cls+'">'+s.label+'</span></td>' +
        '<td>&#8377;'+fmtPrice(p.price*p.stock)+'</td></tr>';
    }).join('') + '</tbody></table></div></div></div>';
}

// ── Search ────────────────────────────────────────────────────
function renderSearch() { refreshCatDatalist(); }

function runSearch() {
  var kw  = document.getElementById('s-kw').value.toLowerCase();
  var cat = document.getElementById('s-cat').value;
  var min = parseFloat(document.getElementById('s-min').value) || 0;
  var max = parseFloat(document.getElementById('s-max').value) || Infinity;
  var st  = document.getElementById('s-status').value;

  var results = products.filter(function(p){
    if (kw && !p.name.toLowerCase().includes(kw) && !p.category.toLowerCase().includes(kw) && !(p.sku||'').toLowerCase().includes(kw)) return false;
    if (cat && p.category !== cat) return false;
    if (p.price < min || p.price > max) return false;
    if (st && getStatus(p).key !== st) return false;
    return true;
  });

  document.getElementById('s-count').textContent = results.length + ' result(s)';
  document.getElementById('s-tbody').innerHTML = results.length === 0
    ? '<tr><td colspan="6" class="text-center text-muted" style="padding:20px;">No results found.</td></tr>'
    : results.map(function(p){
        var s = getStatus(p);
        return '<tr><td><small>'+p.id+'</small></td><td><strong>'+p.name+'</strong></td>' +
          '<td><span class="cat-pill">'+p.category+'</span></td>' +
          '<td>&#8377;'+fmtPrice(p.price)+'</td><td>'+p.stock+'</td>' +
          '<td><span class="'+s.cls+'">'+s.label+'</span></td></tr>';
      }).join('');
}

// ── Add / Edit Modal ──────────────────────────────────────────
function openAddModal() {
  document.getElementById('modal-title').textContent = 'Add New Product';
  document.getElementById('edit-id').value = '';
  ['f-name','f-cat','f-price','f-stock','f-sku','f-desc'].forEach(function(id){ document.getElementById(id).value=''; });
  document.getElementById('f-threshold').value = '10';
  refreshCatDatalist();
  $('#productModal').modal('show');
}

function openEditModal(id) {
  var p = products.find(function(x){ return x.id===id; });
  if (!p) return;
  document.getElementById('modal-title').textContent = 'Edit Product';
  document.getElementById('edit-id').value    = p.id;
  document.getElementById('f-name').value     = p.name;
  document.getElementById('f-cat').value      = p.category;
  document.getElementById('f-price').value    = p.price;
  document.getElementById('f-stock').value    = p.stock;
  document.getElementById('f-threshold').value= p.threshold;
  document.getElementById('f-sku').value      = p.sku   || '';
  document.getElementById('f-desc').value     = p.desc  || '';
  refreshCatDatalist();
  $('#productModal').modal('show');
}

function saveProduct() {
  var name  = document.getElementById('f-name').value.trim();
  var cat   = document.getElementById('f-cat').value.trim();
  var price = parseFloat(document.getElementById('f-price').value);
  var stock = parseInt(document.getElementById('f-stock').value);
  var thr   = parseInt(document.getElementById('f-threshold').value) || 10;
  var sku   = document.getElementById('f-sku').value.trim();
  var desc  = document.getElementById('f-desc').value.trim();

  if (!name || !cat || isNaN(price) || isNaN(stock)) return showToast('Please fill in all required fields', 'danger');

  var editId = document.getElementById('edit-id').value;
  if (editId) {
    var p = products.find(function(x){ return x.id===editId; });
    if (p) { p.name=name; p.category=cat; p.price=price; p.threshold=thr; p.sku=sku; p.desc=desc; }
    showToast('Product updated successfully', 'success');
  } else {
    products.push({id:nextId(), name:name, category:cat, price:price, stock:stock, threshold:thr, sku:sku, desc:desc});
    showToast('Product added successfully', 'success');
  }
  saveData();
  $('#productModal').modal('hide');
  updateNavBadge();
  renderProducts();
}

// ── Delete ────────────────────────────────────────────────────
function openDeleteModal(id, name) {
  deleteId = id;
  document.getElementById('del-name').textContent = name;
  $('#deleteModal').modal('show');
}

function confirmDelete() {
  products = products.filter(function(p){ return p.id !== deleteId; });
  saveData();
  $('#deleteModal').modal('hide');
  showToast('Product deleted', 'danger');
  updateNavBadge();
  renderProducts();
}

// ── Export CSV ────────────────────────────────────────────────
function exportCSV() {
  var rows = [['ID','Name','Category','Price','Stock','Threshold','SKU','Status','Total Value']];
  products.forEach(function(p){
    rows.push([p.id, p.name, p.category, p.price, p.stock, p.threshold, p.sku||'', getStatus(p).label, (p.price*p.stock).toFixed(2)]);
  });
  var csv  = rows.map(function(r){ return r.join(','); }).join('\n');
  var blob = new Blob([csv], {type:'text/csv'});
  var url  = URL.createObjectURL(blob);
  var a    = document.createElement('a');
  a.href = url; a.download = 'inventory_report.csv'; a.click();
  URL.revokeObjectURL(url);
  showToast('CSV exported successfully', 'success');
}

// ── Boot ─────────────────────────────────────────────────────
renderDashboard();
</script>

</body>
</html>
