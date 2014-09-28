unit ini_cat_customer_UNIT;

interface
uses ini_cat_customer_FORM, Forms, pFIBDatabase, Classes,
     Controls, tagBaseTypes, dxBar, IBase, Variants;

type
 Tini_cat_customer = class
  fDB : TpFIBDataBase;
  fReadTransaction  : TpFIBTransaction;
  fWriteTransaction : TpFIBTransaction;
  fOwner            : TForm;
  fOptions          : TSpravOptions;
 public
  MainForm : TFini_cat_customer;
  constructor Create(OwnerForm : TForm; DataBase : TpFIBDataBase; ReadTrans, WriteTrans : TpFIBTransaction; const SpravOptions : TSpravOptions);
  destructor Destroy; override;
  function Show : TResultArray;
  procedure FreeObject;
 end;

function Show_ini_Cat_Customer(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle): variant; stdcall;
exports  Show_ini_Cat_Customer;

implementation
uses Windows, Messages, cxCustomData;

function Show_ini_Cat_Customer(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         FS : TFormStyle): variant; stdcall;
var
 f : TFini_cat_customer;
begin
 if FS = fsNormal then begin
  f := TFini_cat_customer.Create(AOwner);

  f.InitConnection(DBHandle, RTrans);

  GetFormParams(f);

  f.FormStyle  := FS;

  f.SelectAll;

  if f.ShowModal = mrOk then begin
   Result := VarArrayCreate([0, 2], varVariant);

   with F.TableView.DataController do begin
    Result[0] := Values[FocusedRecordIndex, 0]; // id_Customer
    Result[1] := Values[FocusedRecordIndex, 1]; // Name_Customer
   end;
  end;

  SetFormParams(f);
 end
 else begin
  F := TFini_cat_customer.Create(AOwner);
  F.InitConnection(DBHandle, RTrans);

  F.FormStyle  := FS;

  GetFormParams(F);
  f.SelectAll;
 end;
end;

constructor Tini_cat_customer.Create(OwnerForm : TForm; DataBase : TpFIBDataBase; ReadTrans, WriteTrans : TpFIBTransaction; const SpravOptions : TSpravOptions);
begin
 inherited Create;
 fOwner := OwnerForm;
 fDB := DataBase;
 fReadTransaction  := ReadTrans;
 fWriteTransaction := WriteTrans;
 fOptions := SpravOptions;
end;

destructor Tini_cat_customer.Destroy;
begin
 if Assigned(Fini_cat_customer) then Fini_cat_customer.Free;
 Fini_cat_customer := NIL;
 inherited;
end;

function Tini_cat_customer.Show : TResultArray;
var
 id    : integer;
 text  : string;
 mr    : integer;
begin
 if Fini_cat_customer <> NIL then begin
  if not fOptions.isModal then begin
   Fini_cat_customer.Show;
   exit;
  end; 
 end;

 Fini_cat_customer := TFini_cat_customer.Create(fOwner);
 MainForm := Fini_cat_customer;
 MainForm.OwnerSPObject := Self;
 MainForm.DB := fDB;
 MainForm.SelectAll;

 if fOptions.canAdd then MainForm.AddButton.Visible := ivAlways else MainForm.AddButton.Visible := ivNever;
 if fOptions.canEdit then MainForm.EditButton.Visible := ivAlways else MainForm.EditButton.Visible := ivNever;
 if fOptions.canDelete then MainForm.DelButton.Visible := ivAlways else MainForm.DelButton.Visible := ivNever;
 if fOptions.MoveUp then MainForm.MoveUpButton.Visible := ivAlways else MainForm.MoveUpButton.Visible := ivNever;
 if fOptions.MoveDown then MainForm.MoveDownButton.Visible := ivAlways else MainForm.MoveDownButton.Visible := ivNever;
 if fOptions.canSelect then MainForm.SelectButton.Visible := ivAlways else MainForm.SelectButton.Visible := ivNever;

 MainForm.BarManager.Bars[0].Visible := not(fOptions.HideButtons);

 SetLength(Result, 0);
 
 if fOptions.isModal then begin
  mr := MainForm.ShowModal;
  if mr = mrOK then begin
   id   := MainForm.DataSet.FieldByName('ID_CAT_CUST_PARAM').asInteger;
   Text := MainForm.DataSet.FieldByName('NAME_CAT_CUST_PARAM').asString;
   SetLength(Result, 2);
   Result[0] := id;
   Result[1] := Text;
  end;
 end else begin
  MainForm.N6.Visible := false;
  MainForm.Panel.Align  := alBottom;
  MainForm.DBGrid.Align := alClient;
  MainForm.FormStyle := fsMDIChild;
  MainForm.Show;
 end;
end;

procedure Tini_cat_customer.FreeObject;
begin
 Fini_cat_customer := Nil;
end;

end.
