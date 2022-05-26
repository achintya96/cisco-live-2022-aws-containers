#!/usr/bin/env python
import os
import json
from bson import json_util
from bson.json_util import dumps
from flask import Flask, session, render_template, request, redirect, url_for
from pymongo import MongoClient

app = Flask(__name__)
app.secret_key = "secret key"

client = MongoClient("mongo:27017")
db = client.ProductionDB
collection = db.ProductCatalog

@app.route('/')
def hello():
    return render_template('index.html')

@app.route('/shop')
def products():
    try:
        cursors = collection.find()
        doc_list = [json.dumps(doc, default=json_util.default) for doc in cursors]
        doc_dict = [json.loads(doc) for doc in doc_list]
        return render_template('products.html', products=doc_dict)
    except Exception as e:
        print(e)
    finally:
        cursors.close()

@app.route('/shop/add', methods=['POST'])
def add_product_to_cart():
    try:
        code = request.form['code']
     
        if code and request.method == 'POST':
            row = dumps(collection.find({'code': code}))
            itemDict = json.loads(row)
            itemArray = { code: {'name':itemDict[0]['name'], 'unit_price':itemDict[0]['price'], 'price':itemDict[0]['price'], 'code':itemDict[0]['code'], 'quantity':1}}
            all_total_price = 0
            all_total_quantity = 0
         
            session.modified = True
            if 'cart_item' in session:
                if itemArray[code]['code'] in session['cart_item']:
                    for key, value in session['cart_item'].items():
                        if itemArray[code]['code'] == key:
                            session['cart_item'][key]['quantity'] += itemArray[code]['quantity']
                            session['cart_item'][key]['price'] += itemArray[code]['price']
                            session['cart_item'][key]['unit_price'] = itemArray[code]['price']
                else:
                    session['cart_item'] = array_merge(session['cart_item'], itemArray)
                
                for key, value in session['cart_item'].items():
                    individual_price = session['cart_item'][key]['price']
                    individual_quantity = session['cart_item'][key]['quantity']
                    all_total_price = all_total_price + individual_price
                    all_total_quantity = all_total_quantity + individual_quantity
                    
            else:
                session['cart_item'] = itemArray
                all_total_price = all_total_price + itemArray[code]['price']
                all_total_quantity = all_total_quantity + itemArray[code]['quantity']
                
            session['all_total_price'] = all_total_price
            session['all_total_quantity'] = all_total_quantity
            
            return redirect(url_for('.products'))
        
        else:
            return 'Error while adding item to cart'
        
    except Exception as e:
        print(e)


@app.route('/shop/empty')
def empty_cart():
	try:
		session.clear()
		return redirect(url_for('.products'))
	except Exception as e:
		print(e)


@app.route('/shop/delete/<string:code>')
def delete_product(code):
    try:
        session.modified = True
        
        for item in session['cart_item'].items():
            if item[0] == code:
                session['all_total_quantity'] -= 1
                session['all_total_price'] -= session['cart_item'][code]['unit_price']

                if item[1]['quantity'] == 1:
                    session['cart_item'].pop(item[0], None)
                    '''
                    if 'cart_item' in session:
                        for key, value in session['cart_item'].items():
                            individual_price = session['cart_item'][key]['price']
                            session['all_total_price'] = session['all_total_price'] + individual_price
                            '''
                else:
                    session['cart_item'][code]['quantity'] -= 1
                    session['cart_item'][code]['price'] = session['cart_item'][code]['price'] - session['cart_item'][code]['unit_price']
                    

                break
            
        return redirect(url_for('.products'))

    except Exception as e:
        print(e)
                

def array_merge( first_array , second_array ):
	if isinstance( first_array , list ) and isinstance( second_array , list ):
		return first_array + second_array
	elif isinstance( first_array , dict ) and isinstance( second_array , dict ):
		return dict( list( first_array.items() ) + list( second_array.items() ) )
	elif isinstance( first_array , set ) and isinstance( second_array , set ):
		return first_array.union( second_array )
	return False		


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=os.environ.get("FLASK_SERVER_PORT", 9090), debug=True)