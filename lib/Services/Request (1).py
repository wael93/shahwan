
url = 'http://shahwan-qr.com:5000/login_api'
data = {
     'database': 'shahwan',
     'usernameapi': 'admin',
     'passwordapi': '123123',
}


url = 'http://shahwan-qr.com:5000/view_product'
data = {
     'database': 'shahwan',
     'login': 'admin',
     'OdooApi': 'sgsdsfdgfdbrberb',
     'default_code': '0001013073',
}


url = 'http://shahwan-qr.com:5000/qrcode_receive'
data = {
     'database': 'shahwan',
     'login': 'admin',
     'OdooApi': 'sgsdsfdgfdbrberb',
     'date': datetime.today(),
     'qrcode_sale_form_line_ids': '[{"default_code":"0001013073","product_uom_qty":10},{"default_code":"0001013075","product_uom_qty":4}]',
}


url = 'http://shahwan-qr.com:5000/qrcode_inventory'
data = {
     'database': 'shahwan',
     'login': 'admin',
     'OdooApi': 'sgsdsfdgfdbrberb',
     'qr_ref': '123456000',
     'date': datetime.today(),
     'qrcode_inventory_line_ids': '[{"default_code":"000008362016","product_uom_qty":10},{"default_code":"0001013075","product_uom_qty":11}]',
}

