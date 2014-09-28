unit uUpMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmUpLoaderMain, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, StdCtrls, Buttons,uCommonSp,uUpSetGroupForm,
  cxContainer, cxTextEdit, AccMgmt;

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
    GridTVNAME_GROUP: TcxGridDBColumn;
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
    procedure FormCreate(Sender: TObject);
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
    Check:Integer;
    Path:string;
begin
   Path:='/ROOT/UP_MAIN_MENU/UP_REPORTS/GROUP_'+IntToStr(DataModule.LoaderDataSet.FieldByName('GROUP_NUMBER').AsInteger)+'/UP_REP_'+IntToStr(DataModule.LoaderDataSet.FieldByName('ID_SP_REPORT').AsInteger);
   Check := fibCheckPermission(path, 'View');
   if check<>0 then
   begin
      MessageDlg('Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk], 0);
      exit;
   end;
   if not VarIsNull(DataModule.LoaderDataSet['NAME_BPL']) then
   begin
      sp:=GetSprav('UP\'+DataModule.LoaderDataSet['NAME_BPL']);
      if sp<>nil then
      begin
         with sp.Input do
         begin
            Append;
            FieldValues['DBHandle'] := Integer(DataModule.Database.Handle);
            FieldValues['ID_SP_REPORT'] := DataModule.LoaderDataSet.FieldByName('ID_SP_REPORT').AsVariant;
            FieldValues['DesignReport']:=DesignReport;
            Post;
         end;
         sp.Show;
      end;
      sp.Free;
   end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
    DataModule.LoaderDataSet.Close;
    DataModule.LoaderDataSet.SQLs.SelectSQL.Clear;
    DataModule.LoaderDataSet.SQLs.SelectSQL.Text:='select distinct * from up_dt_report_select(:id_user) order by name_group,name_report ';
    DataModule.LoaderDataSet.ParamByName('id_user').AsInteger:=GetUserId;
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
    if not VarIsNull(DataModule.LoaderDataSet['ID_SP_REPORT'])then
    begin
        form:=TGroupEditForm.Create(Self);
        form.DataModule:=DataModule;
        form.IdReport:=DataModule.LoaderDataSet['ID_SP_REPORT'];

        if form.ShowModal=mrOk then
            DataModule.LoaderDataSet.CloseOpen(True);
    end;
end;

procedure TMainForm.SearchEditChange(Sender: TObject);
begin
   GridTv.ViewData.Expand(True);

   if (SearchEdit.Text='') then
    DataModule.LoaderDataSet.Filtered:=False
   else
   begin
    DataModule.LoaderDataSet.Filter:='NAME_REPORT LIKE '+''''+'%'
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

procedure TMainForm.FormCreate(Sender: TObject);
begin
    {кнопка редактирования убрана в соответствии с багом 4291}
    GroupBtn.Visible := False;
    ExitBtn.Left := GroupBtn.Left;
    
end;

end.
