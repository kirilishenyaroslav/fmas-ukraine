{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uAmort_selection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, cxButtons, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxContainer, cxLabel, FIBDataSet, pFIBDataSet, Placemnt,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, Ibase,
  UCreateVed, ClassInvKart, GlobalSpr, ActnList, ImgList, FR_DSet,
  FR_DBSet, FR_Class, uWaite, cxCheckBox, uResources;

type
  TfmAmSelect = class(TForm)
    Panel1: TPanel;
    cxButtonDruk: TcxButton;
    cxButtonSave: TcxButton;
    cxButtonCancel: TcxButton;
    Panel2: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxLabelSchName: TcxLabel;
    cxButtonEditSch: TcxButtonEdit;
    cxLabelMol: TcxLabel;
    cxButtonEditMol: TcxButtonEdit;
    pFIBDataSetShowAllInfo: TpFIBDataSet;
    DataSourceForGrid: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    ForHaeder: TcxStyle;
    AfterSelection: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    FormStorage1: TFormStorage;
    pFIBStoredProcOperations: TpFIBStoredProc;
    pFIBDatabase1: TpFIBDatabase;
    TransactionRead_For_Selection: TpFIBTransaction;
    cxButtonGlyadi: TcxButton;
    ImageListButt: TImageList;
    ActionList1: TActionList;
    ActionSel_po_filtru: TAction;
    cxButton_CleanUp: TcxButton;
    ActionCleaning: TAction;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    pFIBDataSet_Printing_ved: TpFIBDataSet;
    pFIBDataSetShowAllInfoINV_NUM_FULL: TFIBStringField;
    pFIBDataSetShowAllInfoNAME: TFIBStringField;
    pFIBDataSetShowAllInfoSCH_NUMBER: TFIBStringField;
    pFIBDataSetShowAllInfoSFIO: TFIBStringField;
    pFIBDataSetShowAllInfoPERCENT: TFIBBCDField;
    pFIBDataSetShowAllInfoSUMMA_AMORT: TFIBBCDField;
    pFIBDataSetShowAllInfoID_MAN: TFIBBCDField;
    pFIBDataSetShowAllInfoID_SCH: TFIBBCDField;
    cxCheckBoxPrint_znosheni: TcxCheckBox;
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxButtonEditSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditMolPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionSel_po_filtruExecute(Sender: TObject);
    procedure cxButtonEditSchKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditMolKeyPress(Sender: TObject; var Key: Char);
    procedure ActionCleaningExecute(Sender: TObject);
    procedure cxButtonDrukClick(Sender: TObject);
    procedure cxCheckBoxPrint_znosheniPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    fm_baskov           : TfmCreateVedomost;
    id_vedom            : Int64;
    flag_after_save     : boolean;
    praporec_1          : boolean;
    prefixis            : string;
    id_manis, id_schsis : int64;
    prosmot_li,filter_fg: boolean;
    primochil,id_filter : integer;
  public
    { Public declarations }
    //constructor Create(mfrm: TfmCreateVedomost; DataBaskript: TISC_DB_HANDLE; am_id_vedoka : Int64; prosmotr : Boolean); reintroduce; overload;
    ResultArray : Variant;
  end;
  function ShowAm_Ved({mfrm: TfmCreateVedomost;} DataBaskript: TISC_DB_HANDLE; am_id_vedoka : Int64; prosmotr : Boolean) : boolean;
var
  fmAmSelect: TfmAmSelect;

implementation

uses uInvPrinting, uSpMatSchMulti;

{$R *.dfm}

function ShowAm_Ved({mfrm: TfmCreateVedomost;} DataBaskript: TISC_DB_HANDLE; am_id_vedoka : Int64; prosmotr : Boolean) : boolean;
var
   Z : TfmAmSelect;
begin
    Z := TfmAmSelect.Create(nil);
//    Z.fm_baskov                := mfrm;
    Z.id_vedom                 := am_id_vedoka;
    Z.prosmot_li               := prosmotr;
    Z.pFIBDatabase1.Handle     := DataBaskript;
//    Z.TransactionRead_For_Selection.DefaultDatabase := Z.fm_baskov.pFIBDatabase1;
//    Z.pFIBStoredProcOperations.DataBase := Z.fm_baskov.pFIBDatabase1;

    z.primochil := 1;

    Z.flag_after_save          := false;
    Z.Caption                  := MAT_INV_system_name + MAT_INV_amort_caption;
    Z.cxButtonCancel.Caption   := MAT_INV_Cansel;
    Z.cxButtonSave.Caption     := MAT_INV_save;
    Z.cxButtonDruk.Caption     := MAT_INV_Print;
    Z.cxLabelSchName.Caption   := MAT_INV_SCH;
    Z.cxLabelMol.Caption       := MAT_INV_MOL;
    Z.cxButtonGlyadi.Caption   := MAT_INV_sel_in_main;
    Z.cxButton_CleanUp.Caption := MAT_INV_clear;
    Z.cxCheckBoxPrint_znosheni.Properties.Caption := 'Показувати зношені';

    Z.cxGrid1DBTableView1DBColumn1.Caption := MAT_INV_Inv_Num;
    Z.cxGrid1DBTableView1DBColumn2.Caption := MAT_INV_Name;
    Z.cxGrid1DBTableView1DBColumn3.Caption := MAT_INV_SCH;
    Z.cxGrid1DBTableView1DBColumn4.Caption := MAT_INV_MOL;
    Z.cxGrid1DBTableView1DBColumn5.Caption := MAT_INV_Percent;
    Z.cxGrid1DBTableView1DBColumn6.Caption := MAT_INV_obj_sum;
    Z.pFIBDataSetShowAllInfo.Close;
    Z.pFIBDataSetShowAllInfo.SQLs.SelectSQL.Text :='select * from MAT_INV_AMORT_SEL('+IntToStr(Z.id_vedom)+','+IntToStr(Z.primochil)+')';
    Z.pFIBDataSetShowAllInfo.Open;
    if Z.prosmot_li = false then
    begin
        Z.Caption                := MAT_INV_system_name + MAT_INV_look;
        Z.cxButtonSave.Visible   := false;
        Z.flag_after_save        := true;
        Z.cxButtonCancel.Caption := MAT_INV_Close;
    end;
    Z.ShowModal;
    ShowAm_Ved := Z.ResultArray;
    Z.Free;
end;


procedure TfmAmSelect.cxButtonCancelClick(Sender: TObject);
begin
    close;
end;


procedure TfmAmSelect.cxButtonSaveClick(Sender: TObject);
var
   TT : TfmWaite;
begin
    if flag_after_save = false then
    begin
        TT := TfmWaite.creATE(Self);
        TT.Label1.Caption := MAT_INV_loading;
        Application.Initialize;
        TT.Show;
        TT.Repaint;
        TT.cxProgressBar1.Position := 0;



        Save_amort_setings(id_vedom);

        TT.cxProgressBar1.Position := TT.cxProgressBar1.Position + 50;
        TT.UpDate;

        Save_to_ved(id_vedom);
        cxButtonCancel.Caption := MAT_INV_Close;

        TT.cxProgressBar1.Position := TT.cxProgressBar1.Position + 100;
        TT.UpDate;

        ShowMessage(MAT_INV_amort_afte_save);
        TT.Free;
        flag_after_save := true;
    end else
    begin
        ShowMessage(MAT_INV_amort_after_save);
    end;
end;

procedure TfmAmSelect.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if flag_after_save = false then
    begin
        Otmena_amort(id_vedom);
        close;
    end else
    begin
        close;
    end;
end;

procedure TfmAmSelect.cxButtonEditSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 if id_filter = 0 then id_filter := GenId_sessionFilter;
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, pFIBDatabase1.Handle, 0, id_filter, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxButtonEditSch.Text := s;
   filter_fg:=true;
  end
 end
 else
 begin
  filter_fg:=false;
  cxButtonEditSch.Text:='';
 end;

end;

{var
    Res : Variant;
begin
    res := GlobalSpr.GetSch(Self, pFIBDatabase1.Handle, fsNormal, Date, 1, 0, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id_schsis := res[0][0];
            cxButtonEditSch.Text := res[0][3];
        end;
    end;
end;
}

procedure TfmAmSelect.cxButtonEditMolPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aID_MO: integer):Variant;stdcall;
 Res:Variant;
 sResult: string;
begin
 hPack := GetModuleHandle('MatasSpr.bpl');
 if hPack < 32 then hPack := LoadPackage('MatasSpr.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetMatOtv'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, pFIBDatabase1.Handle, 0, id_manis);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
  id_manis:=Res[0];
  cxButtonEditMol.Text:=Res[1]+' / '+Res[2];
 end;
end;

procedure TfmAmSelect.ActionSel_po_filtruExecute(Sender: TObject);
begin
    praporec_1 := false;
    if cxCheckBoxPrint_znosheni.Checked = false then
    begin
        primochil := 1;
    end;
    if cxCheckBoxPrint_znosheni.Checked = true then
    begin
        primochil := 0;
    end;
    
    pFIBDataSetShowAllInfo.close;
    pFIBDataSetShowAllInfo.SelectSQL.Clear;
    pFIBDataSetShowAllInfo.SQLs.SelectSQL.Text :='select * from MAT_INV_AMORT_SEL('+IntToStr(id_vedom)+','+IntToStr(primochil)+')';

    {if id_schsis <> 0 then
    begin
        if praporec_1 = false then
        begin
            prefixis := 'where ';
            pFIBDataSetShowAllInfo.SelectSQL.Add(prefixis + 'ID_SCH= ' + IntToStr(id_schsis));
            praporec_1 := true;
        end else
        begin
            prefixis := 'and ';
            pFIBDataSetShowAllInfo.SelectSQL.Add(prefixis + 'ID_SCH= ' + IntToStr(id_schsis));
        end;
    end;}

    if filter_fg <> false then
    begin
        if praporec_1 = false then
        begin
            prefixis := 'where ';
            pFIBDataSetShowAllInfo.SelectSQL.Add(prefixis +'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_filter)+')');
            praporec_1 := true;
        end else
        begin
            prefixis := 'and ';
            pFIBDataSetShowAllInfo.SelectSQL.Add(prefixis +'ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(id_filter)+')');
        end;
    end;

    if id_manis <> 0 then
    begin
        if praporec_1 = false then
        begin
            prefixis := 'where ';
            pFIBDataSetShowAllInfo.SelectSQL.Add(prefixis + 'ID_MAN= ' + IntToStr(id_manis));
            praporec_1 := true;
        end else
        begin
            prefixis := 'and ';
            pFIBDataSetShowAllInfo.SelectSQL.Add(prefixis + 'ID_MAN= ' + IntToStr(id_manis));
        end;
    end;
    pFIBDataSetShowAllInfo.Open;
    pFIBDataSetShowAllInfo.First;
end;

procedure TfmAmSelect.cxButtonEditSchKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAmSelect.cxButtonEditMolKeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfmAmSelect.ActionCleaningExecute(Sender: TObject);
begin
    cxButtonEditSch.Clear;
    cxButtonEditMol.Clear;
    id_schsis   := 0;
    id_manis    := 0;
    filter_fg   := false;
    id_filter   := 0;
end;

procedure TfmAmSelect.cxButtonDrukClick(Sender: TObject);
var
   Print : TfmPrinting;
begin
    id_schsis := id_filter;
    Print := TfmPrinting.Create(self, id_vedom, id_schsis, id_manis);
    Print.ShowModal;
    Print.Free;
end;

procedure TfmAmSelect.cxCheckBoxPrint_znosheniPropertiesChange(
  Sender: TObject);
begin
    if cxCheckBoxPrint_znosheni.Checked = false then
    begin
        primochil := 1;
        pFIBDataSetShowAllInfo.Close;
        pFIBDataSetShowAllInfo.SQLs.SelectSQL.Text :='select * from MAT_INV_AMORT_SEL('+IntToStr(id_vedom)+','+IntToStr(primochil)+')';
        pFIBDataSetShowAllInfo.Open;
    end;
    if cxCheckBoxPrint_znosheni.Checked = true then
    begin
        primochil := 0;
        pFIBDataSetShowAllInfo.Close;
        pFIBDataSetShowAllInfo.SQLs.SelectSQL.Text :='select * from MAT_INV_AMORT_SEL('+IntToStr(id_vedom)+','+IntToStr(primochil)+')';
        pFIBDataSetShowAllInfo.Open;
    end;
end;

end.
