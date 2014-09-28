unit uMonuViewReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,AArray, FIBDatabase, pFIBDatabase,IB_Externals, frxClass,
  frxDesgn, frxExportRTF, frxExportXML, frxExportHTML, frxExportPDF,
  frxExportImage, DB, FIBDataSet, pFIBDataSet,uMonuLoader, frxDBSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, ImgList, FIBQuery, pFIBQuery, pFIBStoredProc, ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBEdit, cxButtonEdit,LoaderUnit, cxLabel,
  cxCalendar, ComCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, Menus, frxPreview, dxBar, dxBarExtItems, cxRadioGroup, Buttons;

type
  TfrmMonuViewReport = class(TForm)
    Panel1: TPanel;
    cxButtonEditForm: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButtonEditDep: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    cxDateEditBeg: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    frxJPEGExport1: TfrxJPEGExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxDesigner1: TfrxDesigner;
    pFIBDataSet: TpFIBDataSet;
    frxDBDataset: TfrxDBDataset;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    ActionDesReport: TAction;
    StoredProc: TpFIBStoredProc;
    LargeImages: TImageList;
    pFIBDataSetData: TpFIBDataSet;
    pFIBDataSetINFO: TpFIBDataSet;
    pFIBDataSetDefDate: TpFIBDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    frxPreview1: TfrxPreview;
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarDateCombo2: TdxBarDateCombo;
    dxBarEdit1: TdxBarEdit;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarButton3: TdxBarButton;
    dxBarEdit2: TdxBarEdit;
    dxBarButton4: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    dxBarStatic2: TdxBarStatic;
    dxBarStatic3: TdxBarStatic;
    dxBarStatic4: TdxBarStatic;
    dxBarEdit3: TdxBarEdit;
    dxBarButton5: TdxBarButton;
    Image1: TImage;
    rbMonth: TcxRadioButton;
    rbKv: TcxRadioButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    frxReport: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditDepPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure CreateMaster(type_work : Integer);
    function CreateDetail(x,y,width : Double; id_colum : Int64):Integer;
    procedure ActionDesReportExecute(Sender: TObject);
    procedure DefDate( i :Integer);
    procedure N12Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure rbMonthClick(Sender: TObject);
    procedure rbKvClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
  input            : TAArray;
  output           : TAArray;
  id_form          : int64;
  id_dep           : int64;
  IsDesign         : Integer;
  EDRPOU           : String;
  KOATUU           : String;
  ZKGNG            : String;
  SPODU            : String;
  CODE             : String;
  procedure CreateLine();
  procedure SelectForm();
    { Public declarations }
  end;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

var
  frmMonuViewReport: TfrmMonuViewReport;
  Header   : TfrxHeader;
  Memo     : TfrxMemoView;
  CntCol   : Integer;
  CntMemo  : Integer;

implementation

uses DateUtils;

{$R *.dfm}
function Load(input, res : TAArray) : boolean;
var
 frm : TfrmMonuViewReport;
begin
  Result              := true;
  frm                 := TfrmMonuViewReport.Create(TComponent(input['Owner'].asObject));
  frm.input           := TAArray.Create;
  input.CopyTo(frm.input);
  frm.output          := res;
  frm.FormStyle       := frm.input['FormStyle'].AsVariant;
  frm.Database.Handle := pvoid(frm.input['DBHandle'].asInteger);


  if frm.FormStyle = fsNormal then
  begin
    frm.output['MoadResult'].AsVariant := frm.ShowModal;
    frm.Free;
  end
  else
  begin

  end;

  frm.IsDesign := 0;
  frm.id_form  := 0;
  frm.id_dep   := 0;
  frm.SelectForm();

  frm.pFIBDataSetDefDate.Active         := false;
  frm.pFIBDataSetDefDate.Database       := frm.Database;
  frm.pFIBDataSetDefDate.Transaction    := frm.ReadTransaction;
  frm.pFIBDataSetDefDate.SelectSQL.Text := 'select * from MON_GEN_REPORT_DATE(:IS_KVARTAL)';
  if frm.rbMonth.Checked then frm.DefDate(0) else frm.DefDate(1); 
end;

procedure TfrmMonuViewReport.CreateLine();
begin
  //
end;

procedure TfrmMonuViewReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMonuViewReport.GridDBTableView1DblClick(Sender: TObject);
begin
  if pFIBDataSet.RecordCount>0 then
  begin
    id_form := pFIBDataSet.FieldByName('ID_FORM').AsVariant;
  end;
end;

procedure TfrmMonuViewReport.SelectForm();
begin
  pFIBDataSet.Database    := Database;
  pFIBDataSet.Transaction := ReadTransaction;

  pFIBDataSet.SelectSQL.Text := 'select * from MON_SP_FORM';
  pFIBDataSet.Active         := True;

  pFIBDataSet.FetchAll;
  pFIBDataSet.RecordCount;
end;

procedure TfrmMonuViewReport.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TAArray;
 is_kv : integer;
begin
  if rbKv.Checked then is_kv := 1 else is_kv := 0;
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_form_get.spr', 'Main');
  i['SelProc'].AsString := 'MON_GEN_REPORT_GET_FORM('+ VarToStr(id_dep) +', ' +IntToStr(is_kv) +')';

  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);

  if o.Count > 1 then
    begin
      id_form               := o['ID_FORM'].AsInt64;
      cxButtonEditForm.Text := o['NAME_FORM'].AsString;
    end;

  i.Free;
  o.Free;
end;

procedure TfrmMonuViewReport.cxButtonEditDepPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o   : TAArray;
 select : TpFIBDataSet;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['formStyle'].AsInteger := 0;
//  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_org_get.spr', 'Main');
  LoadSprav(ExtractFilePath(Application.ExeName) + 'monu\organizations.bpl', i, o);

  if o.Count > 1 then
    begin
      id_dep               := o['ID_ORGANIZATION'].AsInt64;
      cxButtonEditDep.Text := o['NAME_ORGANIZATION'].AsString;
      EDRPOU               := o['EDRPOU'].AsString;
      if EDRPOU = 'null' then EDRPOU := '';
      KOATUU               := o['KOATUU'].AsString;
      if KOATUU = 'null' then KOATUU := '';
      ZKGNG                := o['ZKGNG'].AsString;
      if ZKGNG = 'null' then ZKGNG := '';
      SPODU                := o['SPODU'].AsString;
      if SPODU = 'null' then SPODU := '';
      CODE                 := o['CODE'].asString;
      if CODE = 'null' then CODE := '';

      cxButtonEditForm.Enabled := true;

      if id_form > 0 then
        begin
           select := TpFIBDataSet.Create(self);

           select.Database    := Database;
           select.Transaction := ReadTransaction;

           select.SelectSQL.Text := 'select * FROM MON_GEN_REPORT_GET_FORM('+ VarToStr(id_dep) +') where id_form = :ID_FORM';

           select.ParamByName('ID_FORM').AsInt64 := id_form;

           select.Active := True;
           select.FetchAll;

           if select.RecordCount = 0 then
             begin
               id_form               := 0;
               cxButtonEditForm.Text := '';
             end;

           select.Destroy;
        end
   end;

  i.Free;
  o.Free;
end;

procedure TfrmMonuViewReport.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMonuViewReport.cxButtonPrintClick(Sender: TObject);
begin
  if id_form = 0 then
    begin
      ShowMessage(mon_strings['MsgNoForm'].asString);
      exit;
    end;

  if id_dep = 0 then
    begin
      ShowMessage(mon_strings['MsgNoOrg'].asString);
      exit;
    end;

  if cxDateEditBeg.Date> cxDateEditEnd.Date then
    begin
      ShowMessage(mon_strings['MsgNotCorrectDAte'].asString);
      exit;
    end;

  pFIBDataSetData.Active         :=false;
  pFIBDataSetData.Database       := Database;
  pFIBDataSetData.Transaction    := ReadTransaction;
  pFIBDataSetData.SelectSQL.Text := 'select * from MON_GEN_REPORT_LINE(:ID_FORM,:ID_ORGANIZATION,:DATE_BEG,:DATE_END,:IS_KVARTAL)';

  pFIBDataSetData.ParamByName('ID_FORM').AsInt64          := id_form;
  pFIBDataSetData.ParamByName('ID_ORGANIZATION').AsInt64  := id_dep;
  pFIBDataSetData.ParamByName('DATE_BEG').AsDateTime      := cxDateEditBeg.Date;
  pFIBDataSetData.ParamByName('DATE_END').AsDateTime      := cxDateEditEnd.Date;
  if rbKv.Checked then
     pFIBDataSetData.ParamByName('IS_KVARTAL').AsInteger     := 1
                  else
     pFIBDataSetData.ParamByName('IS_KVARTAL').AsInteger     := 0;

  pFIBDataSetData.Active := True;
  pFIBDataSetData.FetchAll;

  if pFIBDataSetData.RecordCount = 0 then
    begin
      ShowMessage(mon_strings['MsgNotData'].asString);
      exit;
    end;


  CreateMaster(0);

{  MemoData1.GapX := 2;
  if <frxDBDataset."FAT_LINE">=0 then
    begin
      MemoData1.GapX := 8;
    end;
  if <frxDBDataset."FAT_LINE">=1 then
    begin
      MemoData1.GapX := 2;
    end;
  if <frxDBDataset."FAT_LINE">=2 then
    begin
      MemoData1.GapX := 4;
    end;}
end;

procedure TfrmMonuViewReport.CreateMaster(type_work : Integer);
var
  select       : TpFIBDataSet;
  i            : Integer;
  posx,posy    : Double;
  WIDTH_COLUM  : Double;
  CntRec       : Integer;
  MFR          : TfrxMemoView;
//  MD           : TfrxMasterData;
begin
  CntCol := 1;
  CntMemo := 1;

  select                                     := TpFIBDataSet.Create(self);
  select.Database                            := Database;
  select.Transaction                         := ReadTransaction;
  select.SelectSQL.Text                      := 'select * from MON_SP_COLUMNS,mon_sp_form where MON_SP_COLUMNS.id_form_code=mon_sp_form.id_form_code and  mon_sp_form.id_form=:id_form and linkto=id_column order by num_order';
  select.ParamByName('id_form').AsInt64      := id_form;

  select.Active := True;
  select.FetchAll;

  if select.RecordCount = 0 then
    begin
      ShowMessage(mon_strings['MsgNotHeader'].asString);
      exit;
    end;

  //Header := frxReport.FindObject('Header1') as TfrxHeader;

  posx := 0;
  posy := 0;

  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\MONU\ShablonLine.fr3');
  frxReport.Variables.Clear;


  pFIBDataSetINFO.Active         :=false;
  pFIBDataSetINFO.Database       := Database;
  pFIBDataSetINFO.Transaction    := ReadTransaction;
  pFIBDataSetINFO.SelectSQL.Text := 'select * from MON_GEN_REPORT_INFO_FORM(:ID_FORM,:ID_ORGANIZATION,:DATE_BEG,:DATE_END,:IS_KVARTAL)';

  pFIBDataSetINFO.ParamByName('ID_FORM').AsInt64          := id_form;
  pFIBDataSetINFO.ParamByName('ID_ORGANIZATION').AsInt64  := id_dep;
  pFIBDataSetINFO.ParamByName('DATE_BEG').AsDateTime      := cxDateEditBeg.Date;
  pFIBDataSetINFO.ParamByName('DATE_END').AsDateTime      := cxDateEditEnd.Date;
  if rbKv.Checked then
     pFIBDataSetINFO.ParamByName('IS_KVARTAL').AsInteger     := 1
                  else
     pFIBDataSetINFO.ParamByName('IS_KVARTAL').AsInteger     := 0;

  pFIBDataSetINFO.Active := True;
  pFIBDataSetINFO.FetchAll;

  frxReport.Variables['ORGANIZATION'] := '''' + cxButtonEditDep.Text + '''';
  if rbKv.Checked then
      frxReport.Variables['IS_KVARTAL']   := '''' + IntToStr(1) + ''''
                  else
      frxReport.Variables['IS_KVARTAL']   := '''' + IntToStr(0) + '''';
  frxReport.Variables['NAME_FORM']    := '''' + cxButtonEditForm.Text + '''';
  frxReport.Variables['EDRPOU']       := '''' + EDRPOU + '''';
  frxReport.Variables['KOATUU']       := '''' + KOATUU + '''';
  frxReport.Variables['ZKGNG']        := '''' + ZKGNG + '''';
  frxReport.Variables['SPODU']        := '''' + SPODU + '''';
  frxReport.Variables['CODE']         := '''' + CODE + '''';
  frxReport.Variables['DATE_REPORT']  := '''' + 'станом на ' + pFIBDataSetINFO.FBN('DD').AsString+' '+ pFIBDataSetINFO.FBN('MOUNTH').AsString + ' ' +pFIBDataSetINFO.FBN('YYYY').AsString+' року'+'''';
  frxReport.Variables['NAME_KVK']     := '''' + pFIBDataSetINFO.FBN('NAME_KVK').AsString +'''';
  frxReport.Variables['NAME_PROGRAM'] := '''' + pFIBDataSetINFO.FBN('NAME_PROGRAM').AsString +'''';

  Header := frxReport.FindObject('Header1') as TfrxHeader;

  for i := 0 to select.RecordCount -1 do
    begin
      Memo           := TfrxMemoView.Create(Header);

      Header.CreateUniqueName;

      Memo.Name      := 'MemoHeaderForm'+IntToStr(CntCol);
      Inc(CntCol);

      Memo.Left      := posx;
      Memo.Top       := posy;

      WIDTH_COLUM    := Header.Width*select.FieldByName('PERCENT_COLUM').AsInteger/100;

      Memo.Width       := WIDTH_COLUM;
      Memo.Height      := select.FieldByName('HEIGHT_COLUM').AsInteger;
      Memo.Frame.Typ   := [ftLeft,ftRight,ftBottom,ftTop];
      Memo.Font.Size   := 6;
      Memo.HAlign      := haCenter;
      Memo.VAlign      := frxClass.vaCenter;
      Memo.Text        := select.FieldByName('NAME_COLUMN').AsString;
      Memo.Frame.Width := 0.5;
      Memo.Align       := baLeft;      

      if i = 0 then
        begin
          Header.Height := select.FieldByName('HEIGHT_COLUM').AsInteger;
        end;

      CntRec         := CreateDetail(posx,posy + select.FieldByName('HEIGHT_COLUM').AsInteger,WIDTH_COLUM,select.FieldByName('ID_COLUMN').AsVariant);

      if CntRec = 0 then
        begin
          MFR             := frxReport.FindObject('MemoHeader'+VArToStr(CntMemo)) as TfrxMemoView;
          MFR.Visible     := true;
          MFR.Text        := VarToStr(CntMemo);
          MFR.Width       := WIDTH_COLUM;

          MFR             := frxReport.FindObject('MemoData'+VArToStr(CntMemo)) as TfrxMemoView;
          MFR.Visible     := true;
          MFR.DataSet     := frxDBDataset;
          MFR.Text        := '[frxDBDataset."datacolum'+VarToStr(CntMemo)+'"]';
          MFR.Width       := WIDTH_COLUM;

          if CntMemo = 1 then
              MFR.HAlign      := haLeft;
          if (CntMemo = 2) or (CntMemo = 3) then
              MFR.HAlign      := haCenter;
          if CntMemo > 3 then
              MFR.HAlign      := haRight;

          inc (CntMemo);
        end;

        posx         := posx + WIDTH_COLUM;

      select.Next;
    end;

  if IsDesign = 1 then
    frxReport.DesignReport;

  frxReport.PrepareReport(True);
  frxReport.ShowPreparedReport;

  select.Active := False;
  select.Destroy;
end;


function TfrmMonuViewReport.CreateDetail(x,y,width : Double; id_colum : Int64):Integer;
var
  posx,posy    : Double;
  select       : TpFIBDataSet;
  i            : Integer;
//  curSelect    : Integer;
  WIDTH_COLUM  : Double;
  sWIDTH_COLUM : Double;
  CntRec       : Integer;
  MFR          : TfrxMemoView;
begin
  select                                     := TpFIBDataSet.Create(self);
  select.Database                            := Database;
  select.Transaction                         := ReadTransaction;
  select.SelectSQL.Text                      := 'select * from MON_SP_COLUMNS,mon_sp_form where MON_SP_COLUMNS.id_form_code=mon_sp_form.id_form_code and  mon_sp_form.id_form=:id_form and linkto=:ID_COLUMN and ID_COLUMN<>:id_column order by num_order';
  select.ParamByName('id_form').AsInt64   := id_form;
  select.ParamByName('ID_COLUMN').AsInt64 := id_colum;
  select.Active := True;
  select.FetchAll;

  posx := x;
  posy := y;

  sWIDTH_COLUM := 0;

  for i := 0 to select.RecordCount -1 do
    begin
      Memo           := TfrxMemoView.Create(Header);

      Header.CreateUniqueName;

      Memo.Name      := 'MemoHeaderForm'+IntToStr(CntCol);
      Inc(CntCol);

      Memo.Left      := posx;
      Memo.Top       := posy;

      WIDTH_COLUM    := width*select.FieldByName('PERCENT_COLUM').AsInteger/100;
      if i <> (select.RecordCount -1) then
        begin
          Memo.Width       := WIDTH_COLUM;
          sWIDTH_COLUM     := sWIDTH_COLUM + WIDTH_COLUM;
        end
        else
        begin
          WIDTH_COLUM      := width - sWIDTH_COLUM;
          Memo.Width       := WIDTH_COLUM;
        end;
      Memo.Height      := select.FieldByName('HEIGHT_COLUM').AsInteger;
      Memo.Frame.Typ   := [ftLeft,ftRight,ftBottom,ftTop];
      Memo.Font.Size   := 6;
      Memo.HAlign      := haCenter;
      Memo.VAlign      := frxClass.vaCenter;
      Memo.Text        := select.FieldByName('NAME_COLUMN').AsString;
      Memo.Frame.Width := 0.5;
      Memo.Align       := baLeft;



     CntRec         :=  CreateDetail(posx,posy + select.FieldByName('HEIGHT_COLUM').AsInteger,WIDTH_COLUM,select.FieldByName('ID_COLUMN').AsVariant);

      if CntRec = 0 then
        begin
          MFR             := frxReport.FindObject('MemoHeader'+VArToStr(CntMemo)) as TfrxMemoView;
          MFR.Visible     := true;
          MFR.Text        := VarToStr(CntMemo);
          MFR.Width       := WIDTH_COLUM;

          MFR             := frxReport.FindObject('MemoData'+VArToStr(CntMemo)) as TfrxMemoView;
          MFR.Visible     := true;
          MFR.DataSet     := frxDBDataset;
          MFR.Text        := '[frxDBDataset."datacolum'+VarToStr(CntMemo)+'"]';
          MFR.Width       := WIDTH_COLUM;

          if CntMemo = 1 then
              MFR.HAlign      := haLeft;
          if (CntMemo = 2) or (CntMemo = 3) then
              MFR.HAlign      := haCenter;
          if CntMemo > 3 then
              MFR.HAlign      := haRight;

          inc (CntMemo);
        end;

      posx := posx + WIDTH_COLUM;

      select.Next;
    end;

  CreateDetail := select.RecordCount;
  select.Active := False;
  select.Destroy;
end;

procedure TfrmMonuViewReport.ActionDesReportExecute(Sender: TObject);
begin
  if IsDesign =0 then
    begin
      IsDesign := 1;
//      StatusBar1.Panels.Items[0].Text := 'Дизайн друкованих форм';
    end
    else
    begin
      IsDesign := 0;
//      StatusBar1.Panels.Items[0].Text := '';
    end;
end;

procedure TfrmMonuViewReport.DefDate( i :Integer);
begin
  pFIBDataSetDefDate.Active := false;

  pFIBDataSetDefDate.ParamByName('IS_KVARTAL').AsInteger := i;

  pFIBDataSetDefDate.Active := True;

  cxDateEditBeg.Date := pFIBDataSetDefDate.FBN('DATE_BEG').AsDateTime;
  cxDateEditEnd.Date := pFIBDataSetDefDate.FBN('DATE_END').AsDateTime;
end;

procedure TfrmMonuViewReport.N12Click(Sender: TObject);
begin
 cxDateEditBeg.Date := EncodeDate(YearOf(date), TMenuItem(Sender).Tag, 1);
 cxDateEditEnd.Date := EncodeDate(YearOf(date), TMenuItem(Sender).Tag, DaysInMonth(cxDateEditBeg.Date));
end;

procedure TfrmMonuViewReport.FormPaint(Sender: TObject);
begin
// Canvas.Draw(0, 0, image1.Picture.Bitmap);
frxPreview1.Brush.Color := clred;
end;

procedure TfrmMonuViewReport.dxBarButton5Click(Sender: TObject);
var
 i, o   : TAArray;
 select : TpFIBDataSet;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['formStyle'].AsInteger := 0;
//  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_org_get.spr', 'Main');
  LoadSprav(ExtractFilePath(Application.ExeName) + 'monu\organizations.bpl', i, o);

  if o.Count > 1 then
    begin
      id_dep               := o['ID_ORGANIZATION'].AsInt64;
      dxBarButton5.Caption := o['NAME_ORGANIZATION'].AsString;
      EDRPOU               := o['EDRPOU'].AsString;
      if EDRPOU = 'null' then EDRPOU := '';
      KOATUU               := o['KOATUU'].AsString;
      if KOATUU = 'null' then KOATUU := '';
      ZKGNG                := o['ZKGNG'].AsString;
      if ZKGNG = 'null' then ZKGNG := '';
      SPODU                := o['SPODU'].AsString;
      if SPODU = 'null' then SPODU := '';
      CODE                 := o['CODE'].asString;
      if CODE = 'null' then CODE := '';

      cxButtonEditForm.Enabled := true;

      if id_form > 0 then
        begin
           select := TpFIBDataSet.Create(self);

           select.Database    := Database;
           select.Transaction := ReadTransaction;

           select.SelectSQL.Text := 'select * FROM MON_GEN_REPORT_GET_FORM('+ VarToStr(id_dep) +') where id_form = :ID_FORM';

           select.ParamByName('ID_FORM').AsInt64 := id_form;

           select.Active := True;
           select.FetchAll;

           if select.RecordCount = 0 then
             begin
               id_form               := 0;
               cxButtonEditForm.Text := '';
             end;

           select.Destroy;
        end
   end;

  i.Free;
  o.Free;
end;



procedure TfrmMonuViewReport.rbMonthClick(Sender: TObject);
begin
  DefDate(0);
end;

procedure TfrmMonuViewReport.rbKvClick(Sender: TObject);
begin
  DefDate(1);
end;

procedure TfrmMonuViewReport.FormCreate(Sender: TObject);
begin
  frxPreview1.Zoom := 1.5;
end;

procedure TfrmMonuViewReport.SpeedButton3Click(Sender: TObject);
begin
  frxReport.Print;
end;

end.
