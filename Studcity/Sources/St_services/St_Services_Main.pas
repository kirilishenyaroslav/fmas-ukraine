unit St_Services_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, FIBDataSet, pFIBDataSet, cxContainer, cxLabel,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ImgList, ComCtrls, ToolWin, cxCalendar, cxTextEdit, Menus,
  StdCtrls, cxCurrencyEdit, RxMenus, dxBar, dxStatusBar, AccMGMT,
  St_Common_Types, St_Common_Funcs, st_ConstUnit, FIBDatabase, pFIBDatabase,
  st_Common_Messages, st_consts_messages;

type
  TfrmService_Main = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    SERVICE_TITLE: TcxGridDBColumn;
    SERVICE_SHIFR: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    WriteProc: TpFIBStoredProc;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    RefreshButton: TToolButton;
    ExitButton: TToolButton;
    ImageListOfCategory: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    SelectButton: TToolButton;
    ImageList1: TImageList;
    dxBarManager1: TdxBarManager;
    PopupMenu1: TdxBarPopupMenu;
    N1: TdxBarButton;
    N2: TdxBarButton;
    DeleteAction1: TdxBarButton;
    RefreshAction1: TdxBarButton;
    N3: TdxBarButton;
    PopupImageList: TImageList;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    Cash_Style: TcxStyle;
    SelectAction: TAction;
    WorkDatabase: TpFIBDatabase;
    ServiceDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    ServiceDataSource: TDataSource;
    StoredProc: TpFIBStoredProc;
    Panel1: TPanel;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    ServiceDetailDataSet: TpFIBDataSet;
    ServiceDetailDataSource: TDataSource;
    act_name: TAction;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    Panel2: TPanel;
    Label_razdel_title: TcxLabel;
    Label_stat_title: TcxLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure act_nameExecute(Sender: TObject);
    procedure ServiceDetailDataSetAfterScroll(DataSet: TDataSet);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    Res : Variant;
    constructor Create(AParameter : TstSimpleParams);reintroduce;
  end;

var
  frmService_Main: TfrmService_Main;

implementation

uses St_Services_Edit, St_Services_Details;

{$R *.dfm}

constructor TfrmService_Main.Create(AParameter : TstSimpleParams);
begin
  Inherited Create(AParameter.Owner);
  self.FormStyle:=AParameter.FormStyle;

  if self.FormStyle = fsNormal
   then SelectButton.Visible := true;

  WorkDatabase.Handle:=AParameter.Db_Handle;
  ReadTransaction.StartTransaction;

  RefreshButtonClick(self);

  ServiceDetailDataSet.SelectSQL.Text:='select * from ST_SERVICE_DETAIL_SEL(:ID_SERVICE)';

end;

procedure TfrmService_Main.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=              stLanguageIndex;
 //названия кнопок
 ExitButton.Caption :=         st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 ExitButton.Hint :=            st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

 AddButton.Caption :=          st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 AddButton.Hint :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

 ToolButton1.Caption :=          st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 ToolButton1.Hint :=             st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

 EditButton.Caption :=         st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 EditButton.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

 ToolButton2.Caption :=         st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 ToolButton2.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

 DeleteButton.Caption :=       st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 DeleteButton.Hint :=          st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 ToolButton3.Caption :=       st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 ToolButton3.Hint :=          st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];


 RefreshButton.Caption :=      st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 RefreshButton.Hint :=         st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=      st_ConstUnit.st_Select_Caption[PLanguageIndex];
 SelectButton.Hint :=         st_ConstUnit.st_Select_Caption[PLanguageIndex];

 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_Select_Caption[PLanguageIndex]      + st_ConstUnit.st_EnterBtn_ShortCut[PLanguageIndex];
 HotKey_StatusBar.Panels[5].Text:=  st_ConstUnit.st_ExitBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Hint :=           st_ConstUnit.st_HotKeys[PLanguageIndex];


 // пошел грид
 SERVICE_TITLE.Caption :=    st_ConstUnit.st_NameLable[PLanguageIndex];

 MenuItem1.Caption :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 MenuItem2.Caption :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 MenuItem3.Caption :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 MenuItem4.Caption :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];

 MenuItem1.Hint :=            st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 MenuItem2.Hint :=            st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 MenuItem3.Hint :=            st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 MenuItem4.Hint :=            st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];

 Label_razdel_title.Caption := st_ConstUnit.st_razdel[PLanguageIndex];
 Label_stat_title.Caption   := st_ConstUnit.st_stat[PLanguageIndex];
end;




procedure TfrmService_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmService_Main.FormShow(Sender: TObject);
begin
     cxGrid1.SetFocus;
end;

procedure TfrmService_Main.FormCreate(Sender: TObject);
begin
     FormIniLanguage();
end;

procedure TfrmService_Main.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmService_Main.DataSetAfterOpen(DataSet: TDataSet);
begin
     if (DataSet.RecordCount=0)
     then begin
               EditButton.Enabled := false;
               DeleteButton.Enabled := false;
     end
     else begin
               EditButton.Enabled := true;
               DeleteButton.Enabled := true;
     end;
end;

procedure TfrmService_Main.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     SelectButtonClick(self)
end;

procedure TfrmService_Main.SelectButtonClick(Sender: TObject);
begin
  If ServiceDataSet.RecordCount = 0 then Exit;

  Res := VarArrayOf([ServiceDataSet.FieldByName('ID_SERVICE').value,
                               ServiceDataSet.FieldByName('SERVICE_TITLE').value,
                               ServiceDataSet.FieldByName('SERVICE_SHIFR').value,
                               ServiceDetailDataSet.FieldByName('ST_OPTIONS').Value]);
  ModalResult := mrOk;
end;

procedure TfrmService_Main.RefreshButtonClick(Sender: TObject);
var
  id : integer;
begin
  if ServiceDataSet.RecordCount > 0 then id := ServiceDataSet.FieldByName('ID_SERVICE').Value;

  ServiceDataSet.Close;
  ServiceDataSet.SelectSQL.Text:='select * from ST_SP_SERVICE_SEL';
  ServiceDataSet.Open;

  ServiceDataSet.Locate('ID_SERVICE',id,[]);
end;

procedure TfrmService_Main.AddButtonClick(Sender: TObject);
var T: TfrmServiceEdit;
    id:Integer;
begin
  T:=TfrmServiceEdit.Create(self);
  if T.ShowModal = mrOk then
   begin
    StoredProc.StoredProcName:='ST_SP_SERVICE_INS';
    StoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('SERVICE_TITLE').Value:=T.cxTextEdit1.Text;
    StoredProc.ParamByName('SERVICE_SHIFR').Value:=T.cxTextEdit2.Text;
    StoredProc.ExecProc;
    ID:=StoredProc.ParamByName('ID_SERVICE').Value;
    WriteTransaction.Commit;

    RefreshButtonClick(self);
    ServiceDataSet.Locate('ID_SERVICE',id,[]);
   end;
  T.Free;
end;

procedure TfrmService_Main.EditButtonClick(Sender: TObject);
var T: TfrmServiceEdit;
    id:integer;
begin
  if (ServiceDataSet.RecordCount = 0) then Exit;

  T:=TfrmServiceEdit.Create(self);
  t.cxTextEdit1.Text:=ServiceDataSet.FieldByName('SERVICE_TITLE').Value;
  t.cxTextEdit2.Text:=ServiceDataSet.FieldByName('SERVICE_SHIFR').Value;
  ID:=ServiceDataSet.FieldByName('ID_SERVICE').Value;

  if T.ShowModal = mrOk then
   begin
    StoredProc.StoredProcName:='ST_SP_SERVICE_UPD';
    StoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SERVICE').Value :=id;
    StoredProc.ParamByName('SERVICE_TITLE').Value:=T.cxTextEdit1.Text;
    StoredProc.ParamByName('SERVICE_SHIFR').Value:=T.cxTextEdit2.Text;
    StoredProc.ExecProc;

    WriteTransaction.Commit;

    RefreshButtonClick(self);
    ServiceDataSet.Locate('ID_SERVICE',id,[]);
   end;
  T.Free;
end;

procedure TfrmService_Main.DeleteButtonClick(Sender: TObject);
var
  ID : Integer;
  i : Integer;
begin
  if ServiceDataSet.RecordCount=0 then Exit;

  i:= st_Common_Messages.stShowMessage(st_Confirmation_Caption[PLanguageIndex], st_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  ID:=ServiceDataSet.FieldByName('ID_SERVICE').Value;
  StoredProc.StoredProcName:='ST_SP_SERVICE_DEL';
  StoredProc.Transaction:=WriteTransaction;
  WriteTransaction.StartTransaction;
  StoredProc.Prepare;
  StoredProc.ParamByName('ID_SERVICE').Value := id;
  StoredProc.ExecProc;

  WriteTransaction.Commit;

  ServiceDataSet.CacheDelete;
end;

procedure TfrmService_Main.ToolButton1Click(Sender: TObject);
var
  T, T2 : TfrmServiceDetail;
  id : Integer;
begin
 if ServiceDataSet.RecordCount = 0 then Exit;

  T:=TfrmServiceDetail.Create(self, date,date, WorkDatabase.Handle);

   if T.ShowModal = mrOk then
    begin
     try
      StoredProc.StoredProcName:='ST_SERVICE_DETAIL_INS';
      StoredProc.Transaction:=WriteTransaction;
      WriteTransaction.StartTransaction;
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_SERVICE').Value := ServiceDataSet.FieldByName('ID_SERVICE').Value;
      StoredProc.ParamByName('DATE_BEG').Value   := T.DateBeg;
      StoredProc.ParamByName('DATE_END').Value   := T.DateEnd;
      StoredProc.ParamByName('ID_RAZD_ST').Value := T.ID_RAZD_ST;
      if T.without_pdv.Checked
       then StoredProc.ParamByName('ST_OPTIONS').Value := 0;
      if T.with_pdv.Checked
       then StoredProc.ParamByName('ST_OPTIONS').Value := 1;

      StoredProc.ExecProc;
      id := StoredProc.ParamByName('ID_SERVICE_DETAIL').Value;


      if ((T.with_pdv.Checked) or (T.pdv.Checked)) then
       Begin
        If T.with_pdv.Checked then ShowMessage('Необхідно додати статтю для ПДВ');

        T2 := TfrmServiceDetail.Create(self, date,date, WorkDatabase.Handle);
        T2.without_pdv.Enabled := False;

        If T.with_pdv.Checked then
         Begin
          T2.with_pdv.Enabled := False;
          T2.pdv.Checked := True;
         End
         else
          begin
           T2.pdv.Enabled := False;
           T2.with_pdv.Checked := True;
          end; 

        If T2.ShowModal = mrOk then
         Begin
          StoredProc.StoredProcName:='ST_SERVICE_DETAIL_INS';
          StoredProc.Transaction := WriteTransaction;
          StoredProc.Prepare;
          StoredProc.ParamByName('ID_SERVICE').Value := ServiceDataSet.FieldByName('ID_SERVICE').Value;
          StoredProc.ParamByName('DATE_BEG').Value   := T2.DateBeg;
          StoredProc.ParamByName('DATE_END').Value   := T2.DateEnd;
          StoredProc.ParamByName('ID_RAZD_ST').Value := T2.ID_RAZD_ST;
          StoredProc.ParamByName('ST_OPTIONS').Value := 2;

          StoredProc.ExecProc;
          id := StoredProc.ParamByName('ID_SERVICE_DETAIL').Value;
         End
         else
          begin
           WriteTransaction.Rollback;
           T2.Free;
           T.Free;
           Exit;
          end;
        T2.free;
       End;
       
      WriteTransaction.Commit;

      cxGrid2.BeginUpdate;

      ServiceDetailDataSet.CloseOpen(true);
      ServiceDetailDataSet.Locate('ID_SERVICE_DETAIL',id,[]);

      cxGrid2.EndUpdate;

      except on E:Exception do
       begin
        WriteTransaction.Rollback;
        ShowMessage(E.Message);
        ServiceDetailDataSet.CloseOpen(true);
       end;
     end;
    end;
  T.Free;
end;

procedure TfrmService_Main.ToolButton2Click(Sender: TObject);
var T:TfrmServiceDetail;
    id:Integer;
begin
  if ServiceDataSet.RecordCount > 0 then
   begin
    T := TfrmServiceDetail.Create(self, ServiceDetailDataSet.FieldByName('DATE_BEG').Value ,
                                        ServiceDetailDataSet.FieldByName('DATE_END').Value,
                                        WorkDatabase.Handle);


    if ServiceDetailDataSet.FieldByName('ST_OPTIONS').Value = 0
     then T.without_pdv.Checked := True;

    if ServiceDetailDataSet.FieldByName('ST_OPTIONS').Value = 1
     then T.with_pdv.Checked := True;

    if ServiceDetailDataSet.FieldByName('ST_OPTIONS').Value = 2 then
     Begin
      T.pdv.Checked := True;
      T.pdv.Enabled := True;
     End;

    T.cxButtonEdit1.Text:=ServiceDetailDataSet.FieldByName('RZ_NUM').AsString+'/'+ServiceDetailDataSet.FieldByName('ST_NUM').AsString;
    T.id_razd_st:=ServiceDetailDataSet.FieldByName('ID_RAZD_ST').Value;

    if T.ShowModal = mrOk then
     begin
      try
       StoredProc.StoredProcName:='ST_SERVICE_DETAIL_UPD';
       StoredProc.Transaction:=WriteTransaction;
       WriteTransaction.StartTransaction;
       StoredProc.Prepare;
       StoredProc.ParamByName('ID_SERVICE').Value :=ServiceDataSet.FieldByName('ID_SERVICE').Value;
       id:=ServiceDetailDataSet.FieldByName('ID_SERVICE_DETAIL').Value;
       StoredProc.ParamByName('ID_SERVICE_DETAIL').Value   :=id;
       StoredProc.ParamByName('DATE_BEG').Value   :=T.DateBeg;
       StoredProc.ParamByName('DATE_END').Value   :=T.DateEnd;
       StoredProc.ParamByName('ID_RAZD_ST').Value :=T.ID_RAZD_ST;
       if T.without_pdv.Checked
        then StoredProc.ParamByName('ST_OPTIONS').Value := 0;
       if T.with_pdv.Checked
        then StoredProc.ParamByName('ST_OPTIONS').Value := 1;
       if T.pdv.Checked
        then StoredProc.ParamByName('ST_OPTIONS').Value := 2;

       StoredProc.ExecProc;

       WriteTransaction.Commit;

       cxGrid2.BeginUpdate;
       ServiceDetailDataSet.CloseOpen(true);
       ServiceDetailDataSet.Locate('ID_SERVICE_DETAIL',id,[]);

       cxGrid2.EndUpdate;


       except on E:Exception do
        begin
         ShowMessage(E.Message);
         ServiceDetailDataSet.CloseOpen(true);
        end;
      end;
     end;
    T.Free;
   end;
end;

procedure TfrmService_Main.ToolButton3Click(Sender: TObject);
var ID:Integer;
begin
     if (ServiceDetailDataSet.RecordCount>0)
     then begin
               if Application.MessageBox('Ви дійсно бажаете видалити запис?',
                 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
                         ID:=ServiceDetailDataSet.FieldByName('ID_SERVICE_DETAIL').Value;
                         StoredProc.StoredProcName:='ST_SERVICE_DETAIL_DEL';
                         StoredProc.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         StoredProc.Prepare;
                         StoredProc.ParamByName('ID_SERVICE_DETAIL').Value :=id;
                         StoredProc.ExecProc;

                         WriteTransaction.Commit;

                         ServiceDetailDataSet.CacheDelete;
               end;
     end;
end;

procedure TfrmService_Main.act_nameExecute(Sender: TObject);
begin
  Load_Help(self, WorkDatabase.Handle, 'sp_services');
end;

procedure TfrmService_Main.ServiceDetailDataSetAfterScroll(
  DataSet: TDataSet);
begin
  Label_razdel_title.Caption := st_ConstUnit.st_razdel[PLanguageIndex] + ': ' + ServiceDetailDataSet['RZ_TITLE'];
  Label_stat_title.Caption   := st_ConstUnit.st_stat[PLanguageIndex] + ': ' + ServiceDetailDataSet['ST_TITLE'];
end;

end.
