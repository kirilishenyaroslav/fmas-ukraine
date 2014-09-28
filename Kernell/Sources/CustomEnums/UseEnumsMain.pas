unit UseEnumsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, ComCtrls, ToolWin,
  ImgList, cxControls, cxInplaceContainer, cxTLData, cxDBTL, Menus, Ibase,
  FIBDatabase, pFIBDatabase,pFibStoredProc, DB, FIBDataSet, pFIBDataSet,
  cxMaskEdit, ActnList, Buttons, ExtCtrls, BaseTypes;

type
  TfrmCustomEnums = class(TForm)
    cxDBTreeList1: TcxDBTreeList;
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    ToolBar1: TToolBar;
    InsertButton: TToolButton;
    DeleteButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    CloseButton: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    EnumMainDataSet: TpFIBDataSet;
    EnumMainDataSource: TDataSource;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    WorkPopup: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N10: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N15: TMenuItem;
    N8: TMenuItem;
    N11: TMenuItem;
    N9: TMenuItem;
    N16: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Action2: TAction;
    procedure N1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N2Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure cxDBTreeList1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action1Execute(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    Resultvalue:Variant;
    { Public declarations }
    constructor Create(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE;  FS: TFormStyle); overload;
    constructor Create(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE;  FS: TFormStyle;FilteredValue:Integer);overload;
    procedure DropEnumItem;
    procedure DropEnum;
  end;

  function GetEnumType(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;stdcall;
  function GetEnumTypeFilter(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;Id_filter_Value:integer):Variant;stdcall;
  exports GetEnumType,GetEnumTypeFilter;

implementation

uses EnumEdit,EnumEditItem;

function GetEnumTypeFilter(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;Id_filter_Value:integer):Variant;
var T:TfrmCustomEnums;
    Res:Variant;
begin
    if FS=fsNormal
    then begin
               T:=TfrmCustomEnums.Create(AOwner,DB_HANDLE,FS,Id_filter_Value);
               if T.ShowModal=mrYes
               then begin
                         if T.EnumMainDataSet.RecordCount>0
                         then begin
                              Res:=VarArrayOf([T.EnumMainDataSet.FieldByName('ID_ENUM_VALUE').AsINteger,
                                               T.EnumMainDataSet.FieldByName('ENUM_TITLE').Value,
                                               T.EnumMainDataSet.FieldByName('ENUM_CODE').Value]);
                         end;
               end
               else Res:=NULL;
               T.Free;
    end
    else begin
              Res:=Integer(TfrmCustomEnums.Create(AOwner,DB_HANDLE,FS,Id_filter_Value));
    end;
    GetEnumTypeFilter:=Res;
end;


function GetEnumType(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
var T:TfrmCustomEnums;
    Res:Variant;
begin
    if FS=fsNormal
    then begin
               T:=TfrmCustomEnums.Create(AOwner,DB_HANDLE,FS);
               if T.ShowModal=mrYes
               then begin
                   if T.EnumMainDataSet.RecordCount>0
                   then begin
                              Res:=VarArrayOf([T.EnumMainDataSet.FieldByName('ID_ENUM_VALUE').AsINteger,
                                               T.EnumMainDataSet.FieldByName('ENUM_TITLE').Value,
                                               T.EnumMainDataSet.FieldByName('ENUM_CODE').Value]);
                   end;
               end
               else Res:=NULL;
               T.Free;
    end
    else begin
              Res:=Integer(TfrmCustomEnums.Create(AOwner,DB_HANDLE,FS));
    end;
    GetEnumType:=Res;
end;

constructor TfrmCustomEnums.Create(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE;
  FS: TFormStyle);
begin
     inherited Create(AOwner);
     self.FormStyle:=fs;
     WorkDatabase.Handle:=DB_HANDLE;
     EnumMainDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_USER_ENUM_SELECT';
     EnumMainDataSet.Open;
end;

{$R *.dfm}

procedure TfrmCustomEnums.N1Click(Sender: TObject);
var
  T: TfrmEnumTypeEdit;
  Sp:TpFibStoredProc;
  new_id, i:Integer;
  SysInfo:TpFIBDataSet;
  ANALITIC_COUNT:Integer;
  REAL_ANALITIC_COUNT:Integer;
begin
      //Проверяем настроку по количеству
      SysInfo:=TpFIBDataSet.Create(self);
      SysInfo.Database:=WorkDatabase;
      SysInfo.Transaction:=ReadTransaction;
      SysInfo.SelectSQL.Text:='SELECT ANALITIC_COUNT FROM PUB_SYS_DATA';
      SysInfo.Open;
      if SysInfo.RecordCount>0
      then ANALITIC_COUNT:=SysInfo.FieldByName('ANALITIC_COUNT').Value
      else ANALITIC_COUNT:=0;
      SysInfo.Close;
      SysInfo.Free;

      REAL_ANALITIC_COUNT:=0;
      for i:=0 to cxDBTreeList1.Nodes.Count-1 do
      begin
           if cxDBTreeList1.Nodes[i].Level=0 then REAL_ANALITIC_COUNT:=REAL_ANALITIC_COUNT+1;
      end;

      if REAL_ANALITIC_COUNT<ANALITIC_COUNT
      then begin
                T:=TfrmEnumTypeEdit.Create(self);
                if T.ShowModal=mrYes
                then begin
                           Sp:=TpFibStoredProc.Create(self);
                           Sp.Database:=WorkDatabase;
                           Sp.Transaction:=ReadTransaction;
                           Sp.StoredProcName:='PUB_SP_ENUM_TYPE_INSERT';
                           Sp.Transaction.StartTransaction;
                           Sp.Prepare;
                           Sp.ParamByName('ENUM_TYPE_TITLE').AsString:=T.cxTextEdit1.Text;
                           Sp.ExecProc;
                           New_id:=Sp.ParamByName('ID_ENUM_TYPE').AsInteger;
                           Sp.Transaction.Commit;
                           Sp.Free;
                           EnumMainDataSet.CloseOpen(true);
                           EnumMainDataSet.Locate('ID_ENUM_TYPE',New_Id,[]);
                end;
                T.Free;
      end
      else begin
                agShowMessage('Не можна перевищувати задану кількість аналітик!');
      end;
end;

procedure TfrmCustomEnums.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TfrmCustomEnums.N2Click(Sender: TObject);
var
  T: TfrmEditEnumItem;
  Sp:TpFibStoredProc;
  New_Id:Integer;
begin
      if EnumMainDataSet.RecordCount>0
      then begin
                T:=TfrmEditEnumItem.Create(self);
                T.Label5.Caption:=EnumMainDataSet.FieldByName('ENUM_TITLE').AsString;
                if T.ShowModal=mrYes
                then begin
                          Sp:=TpFibStoredProc.Create(self);
                          Sp.Database:=WorkDatabase;
                          Sp.Transaction:=ReadTransaction;
                          Sp.StoredProcName:='PUB_DT_USER_ENUM_INSERT';
                          Sp.Transaction.StartTransaction;
                          Sp.Prepare;
                          Sp.ParamByName('ID_ENUM_TYPE').AsInteger:=EnumMainDataSet.FieldByName('ID_ENUM_TYPE').AsInteger;
                          Sp.ParamByName('ENUM_TITLE').AsString:=T.cxTextEdit3.Text;
                          Sp.ParamByName('ENUM_CODE').AsString:=T.cxTextEdit2.Text;
                          Sp.ExecProc;
                          New_Id:=Sp.ParamByName('ID_ENUM_VALUE').AsInteger;
                          Sp.Transaction.Commit;
                          Sp.Free;
                          EnumMainDataSet.CloseOpen(true);
                          EnumMainDataSet.Locate('ID_ENUM_VALUE',New_Id,[]);
                end;
                T.Free;
      end;

end;

procedure TfrmCustomEnums.N16Click(Sender: TObject);
begin
    N1Click(self);
end;

procedure TfrmCustomEnums.cxDBTreeList1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (KEY=VK_RIGHT)
  then begin
             if cxDBTreeList1.FocusedNode<>nil
             then cxDBTreeList1.FocusedNode.Expand(false);
  end;

  if (KEY=VK_LEFT)
  then begin
             if cxDBTreeList1.FocusedNode<>nil
             then cxDBTreeList1.FocusedNode.Collapse(false);
  end;

end;

procedure TfrmCustomEnums.Action1Execute(Sender: TObject);
begin
    if self.WindowState=wsMaximized
    then self.WindowState:=wsNormal
    else self.WindowState:=wsMaximized;
end;

procedure TfrmCustomEnums.SpeedButton1Click(Sender: TObject);
begin
    cxDBTreeList1.FullExpand;
end;

procedure TfrmCustomEnums.SpeedButton2Click(Sender: TObject);
begin
   cxDBTreeList1.FullCollapse;
end;

procedure TfrmCustomEnums.SpeedButton3Click(Sender: TObject);
begin
     if cxDBTreeList1.FocusedNode<>nil
     then cxDBTreeList1.FocusedNode.Expand(false);
end;

procedure TfrmCustomEnums.SpeedButton4Click(Sender: TObject);
begin
     if cxDBTreeList1.FocusedNode<>nil
     then cxDBTreeList1.FocusedNode.Collapse(false);
end;

procedure TfrmCustomEnums.DeleteButtonClick(Sender: TObject);
begin
   if cxDBTreeList1.FocusedNode<>nil
   then begin
         if cxDBTreeList1.FocusedNode.HasChildren
         then begin
                   Exit;
         end
         else begin
                   if cxDBTreeList1.FocusedNode.Level>0
                   then DropEnumItem
                   else DropEnum;
         end;
   end;
end;

procedure TfrmCustomEnums.DropEnum;
var Sp:TpFibStoredProc;
begin
      if MessageBox(Handle,PChar('Ви хочете видалити запис?'),PChar('Увага!'),MB_YESNO or MB_ICONERROR)=idYes
      then begin
                 Sp:=TpFibStoredProc.Create(self);
                 Sp.Database:=WorkDatabase;
                 Sp.Transaction:=ReadTransaction;
                 Sp.StoredProcName:='PUB_SP_ENUM_TYPE_DELETE';
                 Sp.Transaction.StartTransaction;
                 Sp.Prepare;
                 Sp.ParamByName('ID_ENUM_TYPE').AsInteger:=EnumMainDataSet.FieldByName('ID_ENUM_TYPE').AsInteger;
                 Sp.ExecProc;
                 Sp.Transaction.Commit;
                 Sp.Free;
                 EnumMainDataSet.CloseOpen(true);
      end;
end;

procedure TfrmCustomEnums.DropEnumItem;
var Sp:TpFibStoredProc;
    New_Id:Integer;
begin
  if MessageBox(Handle,PChar('Ви хочете видали запис?'),PChar('Увага!'),MB_YESNO or MB_ICONERROR)=idYes
  then begin
             New_Id:=EnumMainDataSet.FieldByName('ID_ENUM_TYPE').AsInteger;
             Sp:=TpFibStoredProc.Create(self);
             Sp.Database:=WorkDatabase;
             Sp.Transaction:=ReadTransaction;
             Sp.StoredProcName:='PUB_DT_USER_ENUM_DELETE';
             Sp.Transaction.StartTransaction;
             Sp.Prepare;
             Sp.ParamByName('ID_ENUM_VALUE').AsInteger:=EnumMainDataSet.FieldByName('ID_ENUM_VALUE').AsInteger;
             Sp.ExecProc;
             Sp.Transaction.Commit;
             Sp.Free;
             EnumMainDataSet.CloseOpen(true);
             if EnumMainDataSet.Locate('ID_ENUM_TYPE',New_Id,[])
             then begin
                if cxDBTreeList1.FocusedNode.HasChildren
                then cxDBTreeList1.FocusedNode.Expand(false);
             end;
  end;
end;

procedure TfrmCustomEnums.ToolButton2Click(Sender: TObject);
begin
     if cxDBTreeList1.FocusedNode<>nil
     then begin
               if cxDBTreeList1.FocusedNode.Level>0
               then ModalResult:=mrYes
               else agShowMessage('Не можна вибирати групу аналітик!')
     end;
end;

procedure TfrmCustomEnums.cxDBTreeList1DblClick(Sender: TObject);
begin
     if formstyle=fsnormal
     then ToolButton2Click(self);
end;

constructor TfrmCustomEnums.Create(AOwner: TComponent;
  DB_HANDLE: TISC_DB_HANDLE; FS: TFormStyle; FilteredValue: Integer);
begin
      inherited Create(AOwner);
      self.FormStyle:=fs;
      WorkDatabase.Handle:=DB_HANDLE;
      EnumMainDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_USER_ENUM_SELECT WHERE ID_ENUM_TYPE='+IntToStr(FilteredValue);
      EnumMainDataSet.Open;
end;

procedure TfrmCustomEnums.CloseButtonClick(Sender: TObject);
begin
      close;
end;

end.
