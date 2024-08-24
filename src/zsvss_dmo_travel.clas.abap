CLASS zsvss_dmo_travel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsvss_dmo_travel IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    INSERT zsvss_travel FROM ( SELECT travel_id, total_price, currency_code, description,
    CASE
    WHEN status = 'N' THEN 'O'
    WHEN status = 'P' THEN 'O'
    WHEN status = 'B' THEN 'A'
    ELSE 'X'
    END
    FROM /dmo/travel ).
  ENDMETHOD.
ENDCLASS.
