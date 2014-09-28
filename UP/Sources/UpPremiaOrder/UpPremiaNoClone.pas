unit UpPremiaNoClone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ActnList, ExtCtrls, cxClasses, cxStyles,
  cxGridTableView, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  cxMaskEdit, cxButtonEdit, OleServer, ExcelXP, NagScreenUnit;

type
  TfrmNoCloneForm = class(TForm)
    OkButton: TBitBtn;
    ActionList1: TActionList;
    OKBut: TAction;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn7: TcxGridDBColumn;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    ReportDataViewDBColumn3: TcxGridDBColumn;
    ReportDataViewDBColumn4: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    GetCloneErrorDS: TpFIBDataSet;
    CloneDataSource: TDataSource;
    Panel2: TPanel;
    cntlbl: TcxLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    ExportButton: TBitBtn;
    Panel5: TPanel;
    cxFilName: TcxButtonEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    SaveDialog1: TSaveDialog;
    procedure OKButExecute(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure cxFilNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNoCloneForm: TfrmNoCloneForm;
  KeySession:int64;

implementation

{$R *.dfm}

procedure TfrmNoCloneForm.OKButExecute(Sender: TObject);
begin
     ModalResult := mrYes;
end;

procedure TfrmNoCloneForm.ExportButtonClick(Sender: TObject);
var
  fXl  : TExcelApplication;
  lcid: cardinal;
  R,C, i: integer;
  ASheet: _Worksheet;
  vData: Variant;
  nRec, nf: integer;
begin
    if SaveDialog1.FileName='' then
      begin
       ShowMessage('Потрібно вказати назву файла!');
       exit;
      end;
      NagScreen     := TNagScreen.Create(Application.MainForm);
      NagScreen.Show;
      NagScreen.SetStatusText('Чекайте! Йде обробка даних!');

      lcid := GetUserDefaultLCId;
      fXL := TExcelApplication.Create(nil);
      try
        fXL.ConnectKind := ckNewInstance;
        fXl.Application.AutomationSecurity := 1;
        fXL.DisplayAlerts[lcid] := False;
        fXL.AutoQuit := false;
        fXL.Visible[lcid] := false;
        fXL.Connect;
        fXl.Workbooks.Add(1, lcid);
        nf:=0;
        nf:=ReportDataView.ColumnCount;

        vData := VarArrayCreate([0, GetCloneErrorDS.RecordCount, 1, nf ], varVariant);
        i:=1;
        for C := 0 to ReportDataView.ColumnCount - 1 do
        begin
          vData[0, i] := ReportDataView.Columns[C].Caption;
          Inc(i);
        end;
        nRec:=GetCloneErrorDS.RecNo;
        GetCloneErrorDS.DisableControls;
        GetCloneErrorDS.First;
        R := 1;
        while not GetCloneErrorDS.Eof do begin
         C := 0;
         for i := 0 to ReportDataView.ColumnCount - 1 do
         begin
             Inc(C);
             vData[R, C] := ReportDataView.Columns[i].EditValue;
          end;
         Inc(R);
         GetCloneErrorDS.Next;
        end;
        ASheet := (fXL.ActiveWorkbook.ActiveSheet as _Worksheet);
        with ASheet do with Range['A1', Cells.Item[GetCloneErrorDS.RecordCount + 1, nf]] do
         Formula := vData;
        fXl.UserControl := false;
        ASheet.SaveAs(SaveDialog1.FileName, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam);
        fXL.Quit;
        fXL.Disconnect;
        FreeAndNil(fXL);
        GetCloneErrorDS.RecNo:=nRec;
        GetCloneErrorDS.EnableControls;
        showmessage('Експорт виконано!');
      except on E : Exception
       do begin
         ShowMessage(E.Message);
       end;
      end;
      NagScreen.Free;
end;

procedure TfrmNoCloneForm.cxFilNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
    if SaveDialog1.Execute then
    cxFilName.Text:=SaveDialog1.FileName;
end;

end.
