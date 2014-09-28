unit uMonuViewReportSV;

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
  ExtCtrls;

type
  TfrmMonuViewReportSV = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    cxButtonEditForm: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDateEditBeg: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxButtonPrint: TcxButton;
    cxButtonClose: TcxButton;
    RadioGroup1: TRadioGroup;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    frxJPEGExport1: TfrxJPEGExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxDesigner1: TfrxDesigner;
    frxReport: TfrxReport;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure CreateMaster(type_work : Integer);
    function CreateDetail(x,y,width : Double; id_colum : Int64):Integer;
    procedure ActionDesReportExecute(Sender: TObject);
    procedure DefDate( i :Integer);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup1Exit(Sender: TObject);
  private
    { Private declarations }
  public
  input            : TAArray;
  output           : TAArray;
  id_form          : int64;
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
  frmMonuViewReportSV: TfrmMonuViewReportSV;
  Header   : TfrxHeader;
  Memo     : TfrxMemoView;
  CntCol   : Integer;
  CntMemo  : Integer;

implementation

{$R *.dfm}
function Load(input, res : TAArray) : boolean;
var
 frm : TfrmMonuViewReportSV;
begin
  Result              := true;
  frm                 := TfrmMonuViewReportSV.Create(TComponent(input['Owner'].asObject));
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
  frm.SelectForm();

  frm.pFIBDataSetDefDate.Active         := false;
  frm.pFIBDataSetDefDate.Database       := frm.Database;
  frm.pFIBDataSetDefDate.Transaction    := frm.ReadTransaction;
  frm.pFIBDataSetDefDate.SelectSQL.Text := 'select * from MON_GEN_REPORT_DATE(:IS_KVARTAL)';
  frm.DefDate(frm.RadioGroup1.ItemIndex);
end;

procedure TfrmMonuViewReportSV.CreateLine();
begin
  //
end;
procedure TfrmMonuViewReportSV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmMonuViewReportSV.GridDBTableView1DblClick(Sender: TObject);
begin
if pFIBDataSet.RecordCount>0 then
  begin
    id_form := pFIBDataSet.FieldByName('ID_FORM').AsVariant;
  end;
end;

procedure TfrmMonuViewReportSV.SelectForm();
begin
  pFIBDataSet.Database    := Database;
  pFIBDataSet.Transaction := ReadTransaction;

  pFIBDataSet.SelectSQL.Text := 'select * from MON_SP_FORM';
  pFIBDataSet.Active         := True;

  pFIBDataSet.FetchAll;
  pFIBDataSet.RecordCount;
end;

procedure TfrmMonuViewReportSV.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\mon_sp_form_get.spr', 'Main');
  LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);

  if o.Count > 1 then
    begin
      id_form               := o['ID_FORM'].AsInt64;
      cxButtonEditForm.Text := o['NAME_FORM'].AsString;
    end;

  i.Free;
  o.Free;
end;

procedure TfrmMonuViewReportSV.cxButtonCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMonuViewReportSV.cxButtonPrintClick(Sender: TObject);
begin
  if id_form = 0 then
    begin
      ShowMessage(mon_strings['MsgNoForm'].asString);
      exit;
    end;

  if id_form = 0 then
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
  pFIBDataSetData.SelectSQL.Text := 'select * from MON_GEN_REPORT_SV_7_DETAIL(:DATE_BEG,:DATE_END,:IS_KVARTAL,:ID_FORM)';

  pFIBDataSetData.ParamByName('DATE_BEG').AsDateTime      := cxDateEditBeg.Date;
  pFIBDataSetData.ParamByName('DATE_END').AsDateTime      := cxDateEditEnd.Date;
  pFIBDataSetData.ParamByName('IS_KVARTAL').AsInteger     := RadioGroup1.ItemIndex;
  pFIBDataSetData.ParamByName('ID_FORM').AsInt64          := id_form;
  
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

procedure TfrmMonuViewReportSV.CreateMaster(type_work : Integer);
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
  select.SelectSQL.Text                      := 'select * from MON_SP_COLUMNS,mon_sp_form where MON_SP_COLUMNS.id_form_code=mon_sp_form.id_form_code and  mon_sp_form.id_form=:id_form and linkto=id_column order by id_column';
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


{  pFIBDataSetINFO.Active         :=false;
  pFIBDataSetINFO.Database       := Database;
  pFIBDataSetINFO.Transaction    := ReadTransaction;
  pFIBDataSetINFO.SelectSQL.Text := 'select * from MON_GEN_REPORT_SV_7_DETAIL(:DATE_BEG,:DATE_END,:IS_KVARTAL,:ID_FORM)';

  pFIBDataSetINFO.ParamByName('ID_FORM').AsInt64          := id_form;
  pFIBDataSetINFO.ParamByName('DATE_BEG').AsDateTime      := cxDateEditBeg.Date;
  pFIBDataSetINFO.ParamByName('DATE_END').AsDateTime      := cxDateEditEnd.Date;
  pFIBDataSetINFO.ParamByName('IS_KVARTAL').AsInteger     := RadioGroup1.ItemIndex;

  pFIBDataSetINFO.Active := True;
  pFIBDataSetINFO.FetchAll;}




  frxReport.Variables['IS_KVARTAL']   := '''' + IntToStr(RadioGroup1.ItemIndex) + '''';
  frxReport.Variables['NAME_FORM']    := '''' + cxButtonEditForm.Text + '''';
  frxReport.Variables['EDRPOU']       := '''' + EDRPOU + '''';
  frxReport.Variables['KOATUU']       := '''' + KOATUU + '''';
  frxReport.Variables['ZKGNG']        := '''' + ZKGNG + '''';
  frxReport.Variables['SPODU']        := '''' + SPODU + '''';
  frxReport.Variables['CODE']         := '''' + CODE + '''';
  frxReport.Variables['DATE_REPORT']  := '''' + ''+'''';
  frxReport.Variables['NAME_KVK']     := '''' + '' +'''';
  frxReport.Variables['NAME_PROGRAM'] := '''' + '' +'''';
  frxReport.Variables['ORGANIZATION'] := '''' + '' +'''';

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


function TfrmMonuViewReportSV.CreateDetail(x,y,width : Double; id_colum : Int64):Integer;
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
  select.SelectSQL.Text                      := 'select * from MON_SP_COLUMNS,mon_sp_form where MON_SP_COLUMNS.id_form_code=mon_sp_form.id_form_code and  mon_sp_form.id_form=:id_form and linkto=:ID_COLUMN and ID_COLUMN<>:id_column order by id_column';
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

procedure TfrmMonuViewReportSV.ActionDesReportExecute(Sender: TObject);
begin
  if IsDesign =0 then
    begin
      IsDesign := 1;
      StatusBar1.Panels.Items[0].Text := 'Дизайн друкованих форм';
    end
    else
    begin
      IsDesign := 0;
      StatusBar1.Panels.Items[0].Text := '';
    end;
end;

procedure TfrmMonuViewReportSV.DefDate( i :Integer);
begin
  pFIBDataSetDefDate.Active := false;

  pFIBDataSetDefDate.ParamByName('IS_KVARTAL').AsInteger := i;

  pFIBDataSetDefDate.Active := True;

  cxDateEditBeg.Date := pFIBDataSetDefDate.FBN('DATE_BEG').AsDateTime;
  cxDateEditEnd.Date := pFIBDataSetDefDate.FBN('DATE_END').AsDateTime;       
end;

procedure TfrmMonuViewReportSV.RadioGroup1Click(Sender: TObject);
begin
  DefDate(RadioGroup1.ItemIndex);
end;

procedure TfrmMonuViewReportSV.RadioGroup1Exit(Sender: TObject);
begin
  DefDate(RadioGroup1.ItemIndex);
end;

end.
