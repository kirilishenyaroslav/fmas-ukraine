unit uCountListForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxProgressBar, dxStatusBar,
  dxBarExtItems,uAddToCountList,Ibase,dmPaymentCount,ZProc,ZMessages,
  uNotPassedOrdersList, StdCtrls, ExtCtrls, cxSplitter,uPaymentTableCheck,
  Menus, PackageLoad, ComCtrls, cxTextEdit, PFibDataSet, PFibQuery;

type
  TCountListForm = class(TForm)
    BarManager: TdxBarManager;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    StatusBar: TdxStatusBar;
    dxStatusBar1Container1: TdxStatusBarContainerControl;
    ProgressBar: TcxProgressBar;
    ListGrid: TcxGrid;
    ListGridTabView: TcxGridDBTableView;
    TNColumn: TcxGridDBColumn;
    FIOColumn: TcxGridDBColumn;
    ListGridLevel1: TcxGridLevel;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DeleteMenu: TdxBarPopupMenu;
    DeleteAllItem: TdxBarButton;
    MessagesList: TListBox;
    TitlePanel: TPanel;
    Label1: TLabel;
    cxSplitter2: TcxSplitter;
    dxBarLargeButton3: TdxBarLargeButton;
    ErrorsPopUpMenu: TPopupMenu;
    SaveToFileItem: TMenuItem;
    SaveDialog: TSaveDialog;
    ListGridTabViewDBColumn1: TcxGridDBColumn;
    ListGridTabViewDBColumn2: TcxGridDBColumn;
    ListGridTabViewDBColumn3: TcxGridDBColumn;
    ListGridTabViewDBColumn4: TcxGridDBColumn;
    Panel1: TPanel;
    Label3: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    DateBeg: TDateTimePicker;
    DateEnd: TDateTimePicker;
    procedure InsertBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteBtnClick(Sender: TObject);
    procedure DeleteAllItemClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure SaveToFileItemClick(Sender: TObject);
  private
    TestingUniversalModule:Boolean;
    FAccountType:Integer;
    form:TAddPeopleToListForm;
  public
     constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                            AccountType:Integer);reintroduce;
  end;

var
  CountListForm: TCountListForm;
  DataModule:TMainDm;

implementation

{$R *.dfm}

constructor TCountListForm.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;
                                    AccountType:Integer);
begin
   inherited Create(AOwner);
   TestingUniversalModule:=false;
   FAccountType:=AccountType;

   if (FAccountType=3)
   then begin
             FAccountType:=2;
             TestingUniversalModule:=true;
   end;

   MainDm:=TMainDM.Create(AOwner);
   MainDM.MainDatabase.Handle:=DB_HANDLE;
   MainDM.GetDates;

   ListGridTabView.DataController.DataSource:=MainDM.PeopleDataSource;

   if MainDM.PeopleDataSet.Active then MainDM.PeopleDataSet.Close;
   MainDM.PeopleDataSet.Open;
   MainDM.PeopleDataSet.FetchAll;

   DateBeg.DateTime:=MainDm.DateBeg;
   DateBeg.MinDate:=MainDm.DateBeg;

   DateEnd.DateTime:=MainDm.DateEnd;
   DateEnd.MaxDate:=MainDm.DateEnd;
end;

procedure TCountListForm.InsertBtnClick(Sender: TObject);
begin
    if (form=nil)
    then form:=TAddPeopleToListForm.Create(Self, self.DateBeg.DateTime, self.DateEnd.DateTime)
    else begin
              form.DateBeg.Date:=self.DateBeg.Date;
              form.DateEnd.Date:=self.DateEnd.Date;
    end;

    if  form.ShowModal=mrOk
    then MainDm.PeopleDataSet.CloseOpen(True);
end;

procedure TCountListForm.SelectBtnClick(Sender: TObject);
var
    IdGroupAccount:Integer;
    TotalCount:Integer;
    form:TNotPassedOrdersForm;
    Res:Variant;
    STP_SAVING_DS:TPFibQuery;
begin

    MainDM.CheckOrdersDataSet.Open;
    if ( not MainDM.CheckOrdersDataSet.IsEmpty)
    then
        begin
        ZShowMessage('Попередження',
                    'Знайдено непераді накази!',mtInformation,[mbOk]);
        form:=TNotPassedOrdersForm.Create(Self);

        if (form.ShowModal=mrCancel)
        then

        end;

     ZProc.SetBeginAction(MainDM.MainDatabase.Handle,FAccountType);
     MainDm.WriteTransaction.StartTransaction;
     MainDM.GetGroupQuery.ExecQuery;
     IdGroupAccount:=MainDM.GetGroupQuery['ID_GROUP_ACCOUNT'].value;
     MainDm.WriteTransaction.Commit;


     TotalCount:=MainDM.PeopleDataSet.RecordCount;
     ProgressBar.Properties.Max:=TotalCount;
     MainDM.PeopleDataSet.First;

   with MainDM do
   begin
        while (not PeopleDataSet.Eof)
        do
            begin
                  WriteTransaction.StartTransaction;

                  UniversalCountProc.ParamByName('ID_MAN').Value      :=PeopleDataSet['ID_MAN'];
                  UniversalCountProc.ParamByName('KOD_SETUP_3').Value :=MainDM.KodSetup1;
                  UniversalCountProc.ParamByName('PAYMENT_TYPE').Value:=FAccountType;

                  try
                  UniversalCountProc.ExecQuery;
                  WriteTransaction.Commit;
                  except on E:Exception
                  do
                        begin
                            MessagesList.Items.Add('Помилка! ТН:'+
                            IntToStr(MainDM.PeopleDataSet['OUT_TN'])+' - '
                            +E.Message);
                            WriteTransaction.Rollback;
                        end;
                  end;

                  PeopleDataSet.Next;
                  Application.ProcessMessages;
                  ProgressBar.Position:=ProgressBar.Position+1;
            end;

    ShowMessage('Розрахунок закінчено!');

    ZProc.SetEndAction(MainDM.MainDatabase.Handle,'T');

    if ZShowMessage('Фором. відомостей','Сформувати відомості?',mtConfirmation,[mbOk,mbCancel])=mrOk
    then begin
              Res:=0;
              Res:=uvFormSheet(self,MainDatabase.Handle,FAccountType,null);
              if (Res=-2)
              then begin
                        STP_SAVING_DS:=TPFibQuery.Create(nil);
                        STP_SAVING_DS.Database:=MainDatabase;
                        STP_SAVING_DS.Transaction:=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        STP_SAVING_DS.SQL.Text:='UPDATE Z_SETUP SET DONT_SAVE_CALC=1';
                        STP_SAVING_DS.Prepare;
                        STP_SAVING_DS.ExecQuery;
                        WriteTransaction.Commit;
                        STP_SAVING_DS.Close;
                        STP_SAVING_DS.Free;
              end;
    end;


end;
    SelectBtn.Enabled:=False;
end;

procedure TCountListForm.ExitBtnClick(Sender: TObject);
begin
    MainDM.Free;
    Self.Close;
end;

procedure TCountListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    Action:=caFree;
end;

procedure TCountListForm.DeleteBtnClick(Sender: TObject);
begin
    MainDM.WriteTransaction.StartTransaction;
    MainDM.ClearSpisokProc.ParamByName('ID_MAN').Value:=
        MainDM.PeopleDataSet['ID_MAN'];

    try
        MainDM.ClearSpisokProc.ExecProc;
        MainDM.WriteTransaction.Commit;
    except on E:Exception
    do
        begin
            ShowMessage(E.Message);
            MainDM.WriteTransaction.Rollback;
         end;
    end;

    MainDM.PeopleDataSet.CloseOpen(True);

end;

procedure TCountListForm.DeleteAllItemClick(Sender: TObject);
begin
    MainDM.WriteTransaction.StartTransaction;
    MainDM.ClearSpisokProc.ParamByName('ID_MAN').Value:=null;
    try
        MainDM.ClearSpisokProc.ExecProc;
        MainDM.WriteTransaction.Commit;
    except on E:Exception
    do
        begin
            ShowMessage(E.Message);
            MainDM.WriteTransaction.Rollback;
         end;
    end;

    MainDM.PeopleDataSet.CloseOpen(True);

end;

procedure TCountListForm.dxBarLargeButton3Click(Sender: TObject);
var
    form:TTableCheckForm;
begin
    form:=TTableCheckForm.Create(Self);
    form.ShowModal;
    form.Destroy;
end;

procedure TCountListForm.SaveToFileItemClick(Sender: TObject);
begin
   if (SaveDialog.Execute) then
   begin
        MessagesList.Items.SaveToFile(SaveDialog.FileName);
   end;

end;

end.
