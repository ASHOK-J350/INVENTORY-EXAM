CLASS zcit_cl_22ec301_load_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zcit_cl_22ec301_load_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_products TYPE TABLE OF zcit_prd_22ec301.

    " Clear existing data first
    DELETE FROM zcit_prd_22ec301.

    " Prepare sample data based on Task 9 specifications
    lt_products = VALUE #(
      ( product_id = 'HT-1000' category = 'Laptop'  price = '990.00' currency = 'EUR' supplier_id = '010001' shelflife = 365 )
      ( product_id = 'HT-1001' category = 'Monitor' price = '230.00' currency = 'EUR' supplier_id = '010001' shelflife = 730 )
      ( product_id = 'HT-1002' category = 'Mouse'   price = '25.00'  currency = 'EUR' supplier_id = '010002' shelflife = 30  )
    ).

    " Insert into your custom table
    INSERT zcit_prd_22ec301 FROM TABLE @lt_products.

    IF sy-subrc = 0.
      out->write( 'Data loaded successfully into ZCIT_PRD_22EC301!' ).
    ELSE.
      out->write( 'Error loading data.' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
