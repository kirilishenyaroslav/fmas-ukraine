unit uCs_types;

interface

uses Classes, Ibase, Windows, Forms;


type TCSMode =  (CSShow, CSSelect, CSEdit, CSAdd, CSUpdate, CSDelete, CSInsert);   //расширится со временем

type TZFormStyle = (zfsModal, zfsNormal, zfsChild);    // Для Совместимости с процедурой вызова видопл!! Скопировал из ЗАрплатаДПК чтоб его полностью не подколючать


Type TcsSimpleParam = class(TObject)
  DB_Handle:TISC_DB_HANDLE;
  Owner:TComponent;
end;

Type TcsPaymentTypeParam = class(TcsSimpleParam)    //тип выплаты контингента
  Mode: set of TCSMode;  //тип множества
  ID_PAYMENT_TYPE:Int64;
  NAME_PAYMENT_TYPE:string;
  ID_VIDOPL:Int64;
  ID_TYPE_CALC: integer;
end;


Type TcsVidOplParam = class(TcsSimpleParam)        // для подгрузки видов оплат. спионерил из ЗарплатаДПК, дабы его не привязывать
  PZFormStyle:TZFormStyle;
end;


Type TcsTypeOrderParam = class(TcsSimpleParam)
  Id_order_type:integer;
  Id_order:integer;
  Num_item:integer;
  Num_sub_item:integer;
  outer_hwnd: HWND;
  mode:TCSMode; //0 -add; 1 -update; iz up
end;

type TCSKernelMode =class(TcsSimpleParam)
          TR_HANDLE: TISC_DB_HANDLE;
          ID_ORDER:Int64;
          ID_ORDER_ITEM_IN:Int64;
          ID_SESSION:Int64;
          FILL_INST :Integer;
          FILL_MAIN_DATA:Integer;
          CHECK_DATA:Integer;
end;


type TcsParamPacks= class(TcsSimpleParam)
            Formstyle: TFormStyle;
            mode:integer;
            ID_SESSION: Int64;
            ID_User : Int64;
            ID_Locate : int64;
            ID_Locate_1 : int64;
            ID_Locate_2 : int64;
        end;

implementation

end.
