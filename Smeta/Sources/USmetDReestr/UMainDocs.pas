unit UMainDocs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCheckBox, cxMaskEdit, ComCtrls, ToolWin, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, ImgList, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ExtCtrls,
  StdCtrls, cxContainer, cxMemo, cxDBEdit, FIBDatabase, pFIBDatabase,
  Ibase, Menus, FIBDataSet, pFIBDataSet, cxLookAndFeelPainters, cxButtons,
  cxDropDownEdit, cxCalendar;

type
  TfrmDocReestr = class(TForm)
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxDBMemo1: TcxDBMemo;
    Label1: TLabel;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DocsDataSet: TpFIBDataSet;
    DocsDataSource: TDataSource;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    Panel2: TPanel;
    EdActualDate: TcxDateEdit;
    cxButton1: TcxButton;
    Label2: TLabel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    PopupMenu2: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure N9Click(Sender: TObject);
  private
    id_user:Integer;
    { Private declarations }
  public
    { Public declarations }
    ActualDate:TDateTime;
    Constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Integer);overload;
  end;


  procedure GetSmDReestr(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Integer); stdcall;
  exports GetSmDReestr;

implementation

uses UDocDetail, UGetWorkDate,Kernel,GlobalSpr,BaseTypes, UGetPeriod;

{$R *.dfm}
procedure GetSmDReestr(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_USER:Integer);
var f:Boolean;
    i:Integer;
begin
            f :=true;
            for i:=0 to Application.MainForm.MDIChildCount-1 do
            begin
                 if (Application.MainForm.MDIChildren[i] is TfrmDocReestr)
                 then begin
                                   Application.MainForm.MDIChildren[i].BringToFront;
                                   f:=false;
                 end;
            end;
            if f then TfrmDocReestr.Create(AOwner,DBHandle,ID_USER);
end;

{ TfrmDocReestr }

constructor TfrmDocReestr.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE;ID_USER:Integer);
var T:TfrmGetWorkdate;
    SysDataSet:TpFibDataset;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     SysDataSet:=TpFibDataset.create(self);
     SysDataSet.Database:=WorkDatabase;
     SysDataSet.Transaction:=ReadTransaction;
     SysDataSet.SelectSQL.Text:='select * from pub_sys_data';
     SysDataSet.Open;
     ActualDate:=SysDataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime;
     SysDataSet.Close;
     SysDataSet.Free;


     T:=TfrmGetWorkdate.Create(self,self.ActualDate);
     T.ShowModal;
     self.ActualDate:=T.ActualDate;
     T.Free;

     EdActualDate.Date:=self.ActualDate;
     DocsDataSet.SelectSQL.Text:='SELECT * FROM BU_DT_ALL_DOC_SELECT('+''''+DateTimeToStr(self.ActualDate)+''''+')';
     DocsDataSet.Open;
end;

procedure TfrmDocReestr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmDocReestr.AddButtonClick(Sender: TObject);
begin
     GetBuDoc(Application.MainForm,WorkDatabase.Handle,ActualDate,1,id_user,-1);
end;

procedure TfrmDocReestr.ToolButton2Click(Sender: TObject);
begin
     DocsDataSet.CloseOpen(true);
end;

procedure TfrmDocReestr.cxButton1Click(Sender: TObject);
var  T:TfrmGetWorkdate;
begin
     T:=TfrmGetWorkdate.Create(self,self.ActualDate);
     T.ShowModal;
     self.ActualDate:=T.ActualDate;
     T.Free;

     EdActualDate.Date:=self.ActualDate;
     DocsDataSet.Close;
     DocsDataSet.SelectSQL.Text:='SELECT * FROM BU_DT_ALL_DOC_SELECT('+''''+DateTimeToStr(self.ActualDate)+''''+')';
     DocsDataSet.Open;
end;

procedure TfrmDocReestr.UpdateButtonClick(Sender: TObject);
begin
     if (DocsDataSet.RecordCount>0)
     then begin
                GetBuDoc(Application.MainForm,WorkDatabase.Handle,ActualDate,2,id_user,StrToInt64(DocsDataSet.FieldByName('PK_ID').AsString));
     end;
end;

procedure TfrmDocReestr.ToolButton3Click(Sender: TObject);
begin
     Close;
end;



procedure TfrmDocReestr.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     if (DocsDataSet.RecordCount>0)
     then begin
                GetBuDoc(Application.MainForm,WorkDatabase.Handle,ActualDate,2,id_user,StrToInt64(DocsDataSet.FieldByName('PK_ID').AsString));
     end;
end;

procedure TfrmDocReestr.N1Click(Sender: TObject);
begin
     AddButton.OnClick(self);
end;

procedure TfrmDocReestr.N2Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmDocReestr.N3Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmDocReestr.N5Click(Sender: TObject);
begin
     ToolButton2.OnClick(self);
end;

procedure TfrmDocReestr.N7Click(Sender: TObject);
begin
     ToolButton3.OnClick(self);
end;

procedure TfrmDocReestr.N8Click(Sender: TObject);
var
         STRU:KERNEL_MODE_STRUCTURE;
         DoResult:Boolean;
         MSG_STRING:String;
         ErrorList:TStringList;
         i:INteger;
begin
if (DocsDataSet.RecordCount>0)
then begin
     if BaseTypes.agMessageDlg('Уавга?','Ви хочете видалити документ?',mtWarning,[mbYes,mbNo])=mrYes
     then begin
         WriteTransaction.StartTransaction;
         STRU.KEY_SESSION  :=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
         STRU.DBHANDLE     :=WorkDatabase.Handle;
         STRU.TRHANDLE     :=WriteTransaction.Handle;
         STRU.WORKDATE     :=ActualDate;
         STRU.KERNEL_ACTION:=2;
         STRU.PK_ID:=TFibBCDField(DocsDataSet.FieldByName('PK_ID')).AsInt64;
         DoResult:=Kernel.KernelDo(@STRU);
         if DoResult
         then begin
               DocsDataSet.CacheDelete;
         end
         else begin
               ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
               MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
               if ErrorList<>nil
               then begin
                      for i:=0 to  ErrorList.Count-1 do
                      begin
                            MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                      end;
               end;
               ShowMessage(MSG_STRING);
         end;
         WriteTransaction.Commit;
    end;
end;
end;

procedure TfrmDocReestr.DelButtonClick(Sender: TObject);
var
         STRU:KERNEL_MODE_STRUCTURE;
         DoResult:Boolean;
         MSG_STRING:String;
         ErrorList:TStringList;
         i:INteger;
begin
if (DocsDataSet.RecordCount>0)
then begin
     if BaseTypes.agMessageDlg('Уавга?','Ви хочете видалити документ?',mtWarning,[mbYes,mbNo])=mrYes
     then begin
         WriteTransaction.StartTransaction;
         STRU.KEY_SESSION  :=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
         STRU.DBHANDLE     :=WorkDatabase.Handle;
         STRU.TRHANDLE     :=WriteTransaction.Handle;
         STRU.WORKDATE     :=ActualDate;
         STRU.KERNEL_ACTION:=2;
         STRU.PK_ID:=TFibBCDField(DocsDataSet.FieldByName('PK_ID')).AsInt64;
         DoResult:=Kernel.KernelDo(@STRU);
         if DoResult
         then begin
               DocsDataSet.CacheDelete;
         end
         else begin
               ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
               MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
               if ErrorList<>nil
               then begin
                      for i:=0 to  ErrorList.Count-1 do
                      begin
                            MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                      end;
               end;
               ShowMessage(MSG_STRING);
         end;
         WriteTransaction.Commit;
    end;
end;
end;

procedure TfrmDocReestr.N9Click(Sender: TObject);
var T:TfrmGetPeriod;
    STRU:KERNEL_MODE_STRUCTURE;
    DoResult:Boolean;
    ErrorList:TStringList;
    MSG_STRING:String;
    I:Integer;
begin
if BaseTypes.agMessageDlg('Уавга?','Ви хочете видалити документ?',mtWarning,[mbYes,mbNo])=mrYes
then begin
     if (DocsDataSet.RecordCount>0)
     then begin
               T:=TfrmGetPeriod.Create(self);
               if T.ShowModal=mrYes
               then begin
                         WriteTransaction.StartTransaction;
                         STRU.KEY_SESSION  :=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
                         STRU.DBHANDLE     :=WorkDatabase.Handle;
                         STRU.TRHANDLE     :=WriteTransaction.Handle;
                         STRU.WORKDATE     :=T.cxDateEdit1.Date;
                         STRU.KERNEL_ACTION:=2;
                         STRU.PK_ID:=TFibBCDField(DocsDataSet.FieldByName('PK_ID')).AsInt64;
                         DoResult:=Kernel.KernelDo(@STRU);
                         if DoResult
                         then begin
                               DocsDataSet.CacheDelete;
                         end
                         else begin
                               ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
                               MSG_STRING:='При видаленні документа були виявленні помилки. '+Chr(10)+chr(13);
                               if ErrorList<>nil
                               then begin
                                      for i:=0 to  ErrorList.Count-1 do
                                      begin
                                            MSG_STRING:=MSG_STRING+' ПОМИЛКА- '+ErrorList.Strings[i];
                                      end;
                               end;
                               ShowMessage(MSG_STRING);
                         end;
                         WriteTransaction.Commit;
               end;
               T.Free;
     end;
end;
end;

end.
