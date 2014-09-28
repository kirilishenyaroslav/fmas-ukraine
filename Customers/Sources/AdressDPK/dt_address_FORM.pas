unit dt_address_FORM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  pFIBDatabase, Buttons, ToolWin, ComCtrls, ExtCtrls, FIBQuery, FIBDataSet,
  pFIBDataSet, pFIBStoredProc, ActnList, Menus, COMMON, Grids, Db, DBGrids,
  pFIBQuery, StdCtrls, Variants, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridLevel,
  cxGrid, ImgList, cxDBData, cxGridDBTableView, Ibase, FIBDatabase, GlobalSPR,
  dxBar, dxBarExtItems, cxTL;

type
  TFdt_address = class(TForm)
    ActionList1: TActionList;
    Action_Add: TAction;
    Action_Del: TAction;
    Action_Mod: TAction;
    Action_Refresh: TAction;
    Action_Sel: TAction;
    Action_Exit: TAction;
    DataSet: TpFIBDataSet;
    StoredProc: TpFIBStoredProc;
    DataSource1: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    UpdateButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    procedure ExitButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure Action_AddExecute(Sender: TObject);
    procedure Action_DelExecute(Sender: TObject);
    procedure Action_ModExecute(Sender: TObject);
    procedure Action_RefreshExecute(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure PM_AddButtonClick(Sender: TObject);
    procedure PM_DelButtonClick(Sender: TObject);
    procedure PM_ModButtonClick(Sender: TObject);
    procedure PM_RefreshButtonClick(Sender: TObject);
    procedure PM_SelButtonClick(Sender: TObject);
    procedure PM_ExitButtonClick(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseButtonClick(Sender: TObject);
    procedure ChooseButtonClick(Sender: TObject);
  public
    CurFS:TFormStyle;
    ActualDate:TDateTime;
    ResultValue:Variant;
    CurShowMode:TPublicAdressShowMode;
    CurSelectMode:TPublicAdressSelectMode;
    CurId_adress:Integer;
    constructor Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime;
                       ShowMode:TPublicAdressShowMode;SelectMode:TPublicAdressSelectMode; Id_adress:integer=-1);overload;
    procedure SelectAll;
    procedure LocateRecord(const id : integer);
  end;

function GetAdresses(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;
                     ShowMode:TPublicAdressShowMode;SelectMode:TPublicAdressSelectMode; Id_adress:integer=-1):Variant;stdcall;

exports  GetAdresses;


implementation
uses BaseTypes, SYS_OPTIONS, dt_address_FORM_ADD;
{$R *.DFM}

function GetAdresses(AOwner : TComponent; DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle;ActualDate:TDateTime;
                     ShowMode:TPublicAdressShowMode;SelectMode:TPublicAdressSelectMode; Id_adress:integer=-1):Variant;
    var T:TFdt_address;
        Res:Variant;
begin
    If FS=fsNormal
    then begin
             T:=TFdt_address.Create(AOwner, DBHANDLE,FS,ActualDate,ShowMode,SelectMode,Id_adress);
             if T.ShowModal=mrYes
             then begin
                  Res:=T.ResultValue;
             end;
             T.Free;
    end
    else begin
             T:=TFdt_address.Create(AOwner, DBHANDLE,FS,ActualDate,ShowMode,SelectMode,Id_adress);
             Res:=NULL;
    end;
    GetAdresses:=Res;
end;


constructor TFdt_address.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; FS:TFormStyle; ActualDate:TDateTime;
                                ShowMode:TPublicAdressShowMode;SelectMode:TPublicAdressSelectMode; Id_adress:integer=-1);
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      self.ActualDate:=ActualDate;
      CurShowMode:=ShowMode;
      CurSelectMode:=SelectMode;
      CurId_adress:=Id_adress;
      CurFS:=FS;
      case CurShowMode of
      SHOWALLADRESSES    :begin
                              DataSet.SQLs.SelectSQL.Text := 'select * from PUB_DT_ADDRESS_SELECT(' + IntToStr(CurId_adress) + ',1)';
                           end;
      SHOWONLYADRESS   :begin
                              DataSet.SQLs.SelectSQL.Text := 'select * from PUB_DT_ADDRESS_SELECT(' + IntToStr(CurId_adress) + ',0)';
                           end;
      end;
      DataSet.Open;

end;



procedure TFdt_address.SelectAll;
begin
 DataSet.Active := false;
 case CurShowMode of
 SHOWALLADRESSES    :begin
                        DataSet.SQLs.SelectSQL.Text := 'select * from PUB_DT_ADDRESS_SELECT(' + IntToStr(CurId_adress) + ',1)';
                     end;
 SHOWONLYADRESS   :begin
                        DataSet.SQLs.SelectSQL.Text := 'select * from PUB_DT_ADDRESS_SELECT(' + IntToStr(CurId_adress) + ',0)';
                     end;
 end;
 DataSet.Active := true;
end;




//Add record
procedure TFdt_address.AddButtonClick(Sender: TObject);
var
 id_adr       : integer;
 add_form     : Tfdt_address_form_add;
 id_country   : integer;
 id_region    : integer;
 id_place     : integer;
 id_district  : integer;
 id_type_street: integer;
 street       : string;
 korpus       : string;
 house        : string;
 flat         : string;
 zip          : integer;
 date_beg     : TDate;
 date_end     : TDate;
begin
 add_form := Tfdt_address_form_add.Create(Self);
 add_form.Caption := 'Добавить';
 if add_form.ShowModal = mrOK
 then begin
            id_country     := add_form.id_country;
            id_place       := add_form.id_place;
            id_region      := add_form.id_region;
            id_district := add_form.id_district;
            id_type_street := add_form.id_type_street;
            street      := add_form.StreetEdit.Text;
            korpus      := add_form.KorpusEdit.Text;
            house       := add_form.HouseEdit.Text;
            flat        := add_form.FlatEdit.Text;
            zip         := StrToInt(add_form.ZipEdit.Text);
            date_beg    := now;
            date_end    := SYS_MAX_DATE;

            StoredProc.Transaction.StartTransaction;
            StoredProc.ExecProcedure('PUB_DT_ADDRESS_ADD', [id_country, id_region, id_place, id_district, id_type_street, street, korpus, house, flat, zip, date_beg, date_end]);
            id_adr:=StoredProc.ParamByName('ID_ADDRESS').AsInteger;
            StoredProc.Transaction.Commit;


 end;

 add_form.Free;
 SelectAll;
 DataSet.Locate('ID_ADDRESS',id_adr,[]);
end;

//Modify record
procedure TFdt_address.ModButtonClick(Sender: TObject);
var
 mod_form     : Tfdt_address_form_add;
 id_address    :Integer;
 id_country   : integer;
 id_region    : integer;
 id_place     : integer;
 id_district  : integer;
 id_type_street: integer;
 street       : string;
 korpus       : string;
 house        : string;
 flat         : string;
 zip          : string;
 date_beg     : TDate;
 date_end     : TDate;
begin


 mod_form := Tfdt_address_form_add.Create(Self);
 mod_form.Caption := 'Изменить';
 id_address := DataSet['ID_ADDRESS'];

 mod_form.id_country := DataSet['ID_COUNTRY'];
 mod_form.CountryEdit.Text := DataSet['NAME_COUNTRY'];


 mod_form.id_place := DataSet['ID_PLACE'];
 mod_form.PlaceEdit.Text := DataSet['NAME_PLACE'];

 mod_form.id_region := DataSet['ID_REGION'];
 mod_form.RegionEdit.Text := DataSet['NAME_REGION'];

 mod_form.id_district      := DataSet['ID_DISTRICT'];
 mod_form.DistrictEdit.Text := DataSet['NAME_DISTRICT'];

 mod_form.id_type_street   := DataSet['ID_TYPE_STREET'];
 mod_form.TypeStreetEdit.Text := DataSet['NAME_TYPE_STREET'];

 mod_form.StreetEdit.Text  := DataSet['STREET'];
 mod_form.KorpusEdit.Text  := DataSet['KORPUS'];
 mod_form.HouseEdit.Text   := DataSet['HOUSE'];
 mod_form.FlatEdit.Text    := DataSet['FLAT'];
 mod_form.ZipEdit.Text     := DataSet['ZIP'];

 if mod_form.ShowModal = mrOK
 then begin
          id_country  := mod_form.id_country;
          id_region   := mod_form.id_region;
          id_place    := mod_form.id_place;
          id_district := mod_form.id_district;
          id_type_street := mod_form.id_type_street;
          street      := mod_form.StreetEdit.Text;
          korpus      := mod_form.KorpusEdit.Text;
          house       := mod_form.HouseEdit.Text;
          flat        := mod_form.FlatEdit.Text;
          zip         := mod_form.ZipEdit.Text;
          date_beg    := now;
          date_end    := SYS_MAX_DATE;

          StoredProc.Transaction.StartTransaction;
          StoredProc.ExecProcedure('PUB_DT_ADDRESS_MOD', [id_address, id_country, id_region, id_place, id_district, id_type_street, street, korpus, house, flat, zip, date_beg, date_end]);
          StoredProc.Transaction.Commit;
 end;
 mod_form.Free;
 SelectAll;
 LocateRecord(id_address);
end;

//Delete record
procedure TFdt_address.DelButtonClick(Sender: TObject);
var
 id_address : integer;
begin
 if agMessageDlg('Внимание', DELETE_QUESTION, mtWarning, [mbYes, mbNo]) = mrNo
 then exit;

 id_address := DataSet['ID_ADDRESS'];
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PUB_DT_ADDRESS_DELETE', [id_address,DataSet['DATE_BEG'],DataSet['DATE_END']]);
 StoredProc.Transaction.Commit;

 SelectAll;
end;

//Refresh dbgrid
procedure TFdt_address.RefreshButtonClick(Sender: TObject);
begin
   SelectAll;
end;

//Close form
procedure TFdt_address.ExitButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrCancel;
end;

//Select record
procedure TFdt_address.SelButtonClick(Sender: TObject);
begin
 if FormStyle = fsMDIChild then Close else ModalResult := mrOK;
end;

//////////////////////////////////////////////////////////////
// Other procedures(database dependent)
//////////////////////////////////////////////////////////////
procedure TFdt_address.LocateRecord(const id : integer);
begin
 DataSet.Locate('ID_ADDRESS', id, []);
end;



procedure TFdt_address.DBGridDblClick(Sender: TObject);
begin
end;


//////////////////////////////////////////////////////////////
// Actions procedures
//////////////////////////////////////////////////////////////
procedure TFdt_address.Action_AddExecute(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFdt_address.Action_DelExecute(Sender: TObject);
begin
 if DelButton.Enabled then DelButtonClick(Self);
end;

procedure TFdt_address.Action_ModExecute(Sender: TObject);
begin
 if UpdateButton.Enabled then ModButtonClick(Self);
end;

procedure TFdt_address.Action_RefreshExecute(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFdt_address.Action_ExitExecute(Sender: TObject);
begin
 ExitButtonClick(Self);
end;


//////////////////////////////////////////////////////////////
// Popup menu procedures
//////////////////////////////////////////////////////////////
procedure TFdt_address.PM_AddButtonClick(Sender: TObject);
begin
 AddButtonClick(Self);
end;

procedure TFdt_address.PM_DelButtonClick(Sender: TObject);
begin
 DelButtonClick(Self);
end;

procedure TFdt_address.PM_ModButtonClick(Sender: TObject);
begin
 ModButtonClick(Self);
end;

procedure TFdt_address.PM_RefreshButtonClick(Sender: TObject);
begin
 RefreshButtonClick(Self);
end;

procedure TFdt_address.PM_SelButtonClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;

procedure TFdt_address.PM_ExitButtonClick(Sender: TObject);
begin
 ExitButtonClick(Self);
end;

procedure TFdt_address.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TFdt_address.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TFdt_address.ChooseButtonClick(Sender: TObject);
begin
   if DataSet.Active and (dataSet.RecordCount>0)
   then begin
         ResultValue:=VarArrayCreate([0,9],varVariant);
         ResultValue[0]:=DataSet['ID_ADDRESS'];
         ResultValue[1]:=DataSet['NAME_COUNTRY'];
         ResultValue[2]:=DataSet['REGION'];
         ResultValue[3]:=DataSet['PLACE'];
         ResultValue[4]:=DataSet['NAME_DISTRICT'];
         ResultValue[5]:=DataSet['STREET_COMPARED'];
         ResultValue[6]:=DataSet['KORPUS'];
         ResultValue[7]:=DataSet['HOUSE'];
         ResultValue[8]:=DataSet['FLAT'];
         ResultValue[9]:=DataSet['ZIP'];
         ModalResult := mrYes;
   end;
end;

end.
