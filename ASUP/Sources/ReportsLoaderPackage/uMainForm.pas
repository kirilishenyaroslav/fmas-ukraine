unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmLoaderMain, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, StdCtrls, Buttons,uCommonSp,uSetGroupForm,
  cxContainer, cxTextEdit;

type
  TMainForm = class(TForm)
    ToolPanel: TPanel;
    GridTV: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    GridTVREPORT_TITLE: TcxGridDBColumn;
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
    qizzStyle: TcxGridTableViewStyleSheet;
    ShowReportBtn: TBitBtn;
    GroupBtn: TBitBtn;
    GridTVDBColumn1: TcxGridDBColumn;
    SearchPanel: TPanel;
    Label1: TLabel;
    SearchEdit: TEdit;
    ExitBtn: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowReportBtnClick(Sender: TObject);
    procedure CloseFormBtnClick(Sender: TObject);
    procedure GroupBtnClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure GridTVKeyPress(Sender: TObject; var Key: Char);
    procedure ExitBtnClick(Sender: TObject);
    procedure GridTVDblClick(Sender: TObject);
  private
    procedure ShowReport();

  public

    DesignReport    :Boolean;
    DataModule      :TMainDM;

  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
procedure TMainForm.ShowReport();
var
    sp:TSprav;
begin
    sp:=GetSprav(DataModule.LoaderDataSet['PACKAGE_NAME']);

    if sp<>nil then
    begin

        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DataModule.Database.Handle);
            FieldValues['DesignReport']:=DesignReport;
            Post;
        end;

        sp.Show;
    end;

   sp.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
    DataModule.LoaderDataSet.Open;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataModule.LoaderDataSet.Close;
end;

procedure TMainForm.ShowReportBtnClick(Sender: TObject);
begin
    ShowReport;
end;

procedure TMainForm.CloseFormBtnClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TMainForm.GroupBtnClick(Sender: TObject);
var
    form: TGroupEditForm;
begin

    form:=TGroupEditForm.Create(Self);
    form.DataModule:=DataModule;
    form.IdReport:=DataModule.LoaderDataSet['ID_REPORT'];

    if form.ShowModal=mrOk then
        DataModule.LoaderDataSet.CloseOpen(True);

end;

procedure TMainForm.SearchEditChange(Sender: TObject);
begin
   GridTv.ViewData.Expand(True);

   if (SearchEdit.Text='') then
    DataModule.LoaderDataSet.Filtered:=False
   else
   begin
    DataModule.LoaderDataSet.Filter:='REPORT_TITLE LIKE '+''''+'%'
                                                    +SearchEdit.Text+'%'+'''';
    DataModule.LoaderDataSet.Filtered:=True;

   end;

end;


procedure TMainForm.GridTVKeyPress(Sender: TObject; var Key: Char);
begin
    SearchEdit.Text:=SearchEdit.Text+Key;
end;



procedure TMainForm.ExitBtnClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TMainForm.GridTVDblClick(Sender: TObject);
begin
    Self.ShowReportBtnClick(Sender);
end;

end.
