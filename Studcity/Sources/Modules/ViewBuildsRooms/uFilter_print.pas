unit uFilter_print;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxDropDownEdit, cxMaskEdit, cxSpinEdit, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxLabel, iBase, DB, FIBDataSet, pFIBDataSet,
  frxExportPDF, frxExportRTF, frxExportXLS, frxClass, frxExportTXT,
  frxDBSet, frxDesgn, ActnList;

type
  TfrmFilter_print = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxCheckBox1: TcxCheckBox;
    onPrint: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxLabel3: TcxLabel;
    kol_exampl: TcxSpinEdit;
    ComboBox_Builds: TcxComboBox;
    TextEdit_Room: TcxTextEdit;
    Button_Print: TcxButton;
    Button_Cancel: TcxButton;
    DataSet_Filter: TpFIBDataSet;
    frxReport1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    ActionList1: TActionList;
    Action_Debug: TAction;
    procedure Button_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button_PrintClick(Sender: TObject);
    procedure Action_DebugExecute(Sender: TObject);
  private
    isDebug: Boolean;
    builds_id : array of Int64;
  public
    {}
  end;

var
  frmFilter_print: TfrmFilter_print;

implementation

uses MainFormViewBuildsRooms;

{$R *.dfm}

procedure TfrmFilter_print.Button_CancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmFilter_print.FormCreate(Sender: TObject);
var
  I : Integer;
begin
  isDebug := false;

  DataSet_Filter.Close;
  DataSet_Filter.SQLs.SelectSQL.Text := 'Select ID_BUILD, NAME_BUILD from ST_SP_BUILDS';
  DataSet_Filter.Open;
  DataSet_Filter.FetchAll;
  DataSet_Filter.First;

  ComboBox_Builds.Properties.Items.Clear;
  ComboBox_Builds.Properties.Items.Add('');

  SetLength(builds_id, DataSet_Filter.RecordCount);

  for i := 0 to DataSet_Filter.RecordCount - 1 do
   Begin
    ComboBox_Builds.Properties.Items.Add(DataSet_Filter['NAME_BUILD']);
    builds_id[i] := DataSet_Filter['ID_BUILD'];
    DataSet_Filter.Next;
   end;
  DataSet_Filter.Close;

  ComboBox_Builds.ItemIndex := 0;
end;

procedure TfrmFilter_print.Button_PrintClick(Sender: TObject);
begin
  DataSet_Filter.Close;
  DataSet_Filter.SQLs.SelectSQL.Text := 'SELECT * FROM ST_DT_BUILDS_ROOMS_PRINT';

  if ComboBox_Builds.Text <> ''
   then DataSet_Filter.SQLs.SelectSQL.Add('WHERE  ID_BUILD = ' + IntToStr(Builds_id[ComboBox_Builds.ItemIndex - 1]));

  if ((ComboBox_Builds.Text = '') and (TextEdit_Room.Text <> ''))
   then DataSet_Filter.SQLs.SelectSQL.Add('Where NUM_ROOMS LIKE ''' + TextEdit_Room.Text + '''');

  if ((ComboBox_Builds.Text <> '') and (TextEdit_Room.Text <> ''))
   then DataSet_Filter.SQLs.SelectSQL.Add('and NUM_ROOMS LIKE ''' + TextEdit_Room.Text + '''');

  if ((not cxCheckBox1.Checked) and ((ComboBox_Builds.Text <> '') or (TextEdit_Room.Text <> '')))
   then DataSet_Filter.SQLs.SelectSQL.Add('AND not FIO is null');

  if ((not cxCheckBox1.Checked) and ((ComboBox_Builds.Text = '') and (TextEdit_Room.Text = '')))
   then DataSet_Filter.SQLs.SelectSQL.Add('Where not FIO is null');

  DataSet_Filter.SQLs.SelectSQL.Add('ORDER BY NAME_BUILD, NUM_R, ID_TYPE_ROOM, FIO');
  DataSet_Filter.Open;

  frxReport1.Clear;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Studcity\frStudentsRoom.fr3');
  frxReport1.Variables.Clear;

  frxReport1.PrintOptions.Copies := kol_exampl.Value;

  frxReport1.PrepareReport(True);
  if IsDebug
   then frxReport1.DesignReport
   else if OnPrint.Checked
         then frxReport1.print
         else frxReport1.ShowReport;
end;

procedure TfrmFilter_print.Action_DebugExecute(Sender: TObject);
begin
  if isDebug then
   Begin
    isDebug := False;
    Caption := 'Параметры друку'
   end
  else
   Begin
    isDebug := True;
    Caption := Caption + '*isDebug';
   end;

end;

end.
