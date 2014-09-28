unit ObjectActions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ActnList, Menus, MainDM, Db, IBCustomDataSet, IBQuery,
  IBDatabase, AccessObject, Action, AddObject, StdCtrls, Grids, DBGrids, ExtCtrls,
  ActionsForm, DBTables, ToolWin, RolesForm, Role, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxControls, cxTLData, cxClasses, cxFilterControl, cxDBFilterControl,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridTableView,
  cxGridCustomTableView, cxGridDBTableView, cxGridLevel, cxGridCustomView,
  cxGrid, FIBDataSet, pFIBDataSet, cxTextEdit, Buttons,Variants, IBSQL,
  cxContainer, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Placemnt, IniFiles, dxBar, pFibStoredProc, cxLabel,
  frxClass, frxDBSet, RxMemDS, zcxLocateBar, frxExportRTF, frxExportHTML,
  frxExportImage, frxExportPDF, frxExportXML, cxDBEdit;

type
  TFormObjectActions = class(TForm)
    ActionList: TActionList;
    Add: TAction;
    Edit: TAction;
    StatusBar: TStatusBar;
    DataSourceActions: TDataSource;
    Splitter1: TSplitter;
    Del: TAction;
    ActionRolePanel: TPanel;
    AddInObj: TAction;
    DelFromObj: TAction;
    AddRole: TAction;
    DelRole: TAction;
    TreeDataSource: TDataSource;
    TreeObjects: TTreeView;
    TreeObjectPanel: TPanel;
    cxStyleRepository1: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    ObjectTreeList: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    ObjectTreeListcxDBTreeListColumn1: TcxDBTreeListColumn;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    Panel4: TPanel;
    treeFIBDataSet: TpFIBDataSet;
    queryActions: TpFIBDataSet;
    Panel5: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Splitter2: TSplitter;
    Panel6: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    CurPathPanel: TPanel;
    Splitter3: TSplitter;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    Panel8: TPanel;
    CurDataSet: TpFIBDataSet;
    CurDataSource: TDataSource;
    rolesDataSet: TpFIBDataSet;
    rolesDataSource: TDataSource;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SystemDataSet: TpFIBDataSet;
    SysDataSource: TDataSource;
    Systems: TcxLookupComboBox;
    FormStorage1: TFormStorage;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    BarDockLocate: TdxBarDockControl;
    BarManager: TdxBarManager;
    Groups: TcxLookupComboBox;
    cxLabelGroup: TcxLabel;
    GroupDataSet: TpFIBDataSet;
    GroupDataSource: TDataSource;
    Users: TcxLookupComboBox;
    cxLabelUser: TcxLabel;
    UserDataSet: TpFIBDataSet;
    UserDataSource: TDataSource;
    TextEditGroup: TcxTextEdit;
    TextEditUser: TcxTextEdit;
    ToolButtonPrint: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    queryActionsID_ACTION: TFIBIntegerField;
    queryActionsNAME: TFIBStringField;
    queryActionsFULL_NAME: TFIBStringField;
    queryActionsID_OBJECT: TFIBIntegerField;
    DataSourcePrint: TDataSource;
    DataSetPrint: TpFIBDataSet;
    DataSetPrintAction: TpFIBDataSet;
    DataSourcePrintAction: TDataSource;
    RxMemoryData1: TRxMemoryData;
    ObjectTreeListcxDBTreeListColumn2: TcxDBTreeListColumn;
    frxDBDataset3: TfrxDBDataset;
    DataSetPrintRole: TpFIBDataSet;
    DataSourcePrintRole: TDataSource;
    Print: TAction;
    frxReport1: TfrxReport;
    frxXMLExport1: TfrxXMLExport;
    frxPDFExport1: TfrxPDFExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButtonAddRoleClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ObjectTreeListExpanded(Sender: TObject;
      ANode: TcxTreeListNode);
    procedure SpeedButton4Click(Sender: TObject);
    procedure ObjectTreeListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure SystemsPropertiesCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GroupsPropertiesChange(Sender: TObject);
    procedure SystemsPropertiesChange(Sender: TObject);
    procedure UsersPropertiesChange(Sender: TObject);
    procedure TextEditUserClick(Sender: TObject);
    procedure ToolButtonPrintClick(Sender: TObject);
    procedure TextEditGroupClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String; var Value: Variant);
    procedure PrintExecute(Sender: TObject);
  private
  public
    { Public declarations }
    constructor Create(AOwner:TComponent);reintroduce;
    procedure FilterPropertiesChange;
  end;

implementation

uses ObjectFilter, cxLookupDBGrid, cxLookupGrid;

{$R *.DFM}

procedure TFormObjectActions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

constructor TFormObjectActions.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SendMessage(handle,WM_SIZE,SIZE_MAXIMIZED,0);

  SystemDataSet.SelectSQL.Text:='SELECT * FROM SYS_SYSTEMS ORDER BY ID_SYSTEM ASC';
  SystemDataSet.open;
  Systems.EditValue:=-1;

  GroupDataSet.SelectSQL.Text := 'select first 1 cast(-1 as integer) as id_role , cast('' ВСІ'' as varchar(20)) as name, cast(''Без фільтру'' as varchar(50)) as full_name, cast(''ВСІ  -  Без фільтру'' as varchar(75)) as f_n from roles'+
                                 ' union '+
                                 'select r.*, r.NAME||''  -  ''||r.FULL_NAME as f_n from roles r order by 2';
  GroupDataSet.Open;
//  GroupDataSet.FetchAll;
  Groups.EditValue:=-1;

  UserDataSet.SelectSQL.Text := 'select u.id_user, u.name, u.full_name, u.NAME||''  -  ''||u.FULL_NAME as f_u from ACCESS_USER_SELECT u'+
                                ' union '+
                                'select first 1 cast(-1 as integer) as id_user, cast(''ВСІ'' as varchar(255)) AS NAME, cast('' Без фільтру'' as varchar(255)) as FULL_NAME, cast(''ВСІ  -  Без фільтру'' as varchar(515)) as f_u from users order by 3';
  UserDataSet.Open;
//  UserDataSet.FetchAll;
  Users.EditValue:=-1;

  treeFIBDataSet.SelectSQL.Text:='Select * from OBJECTS_SELECT('+VarToStr(Systems.EditValue)+','+VarToStr(Groups.EditValue)+','+VarToStr(Users.EditValue)+')';
  treeFIBDataSet.Open;
  treeFIBDataSet.FetchAll;

  queryActions.Close;
  queryActions.SelectSQL.Text:='select actions.*, objects_actions.id_object '+
                               '  from actions, objects_actions             '+
                               ' where actions.id_action=objects_actions.id_action '+
                               '   and objects_actions.id_object=?id_object';
  rolesDataSet.Close;
  rolesDataSet.SelectSQL.Text:='select p.*, r.name, r.full_name     '+
                               '  from permissions p, roles r       '+
                               ' where p.id_object =?id_object      '+
                               '   and p.id_action =?id_action      '+
                               '   and p.id_role   =r.id_role       ';

  CurDataSet.SelectSQL.Text :='select * from OBJECTS_SELECT_CUR_PATH(?id_parent)';

  ObjectTreeList.FocusedNode:=ObjectTreeList.Items[1];
end;

procedure TFormObjectActions.ToolButtonAddRoleClick(Sender: TObject);
var
   FormRoles: TFormRoles;
begin
     FormRoles := TFormRoles.Create(Self, fmSelect,-1,-1);
     FormRoles.Show;
end;

procedure TFormObjectActions.SpeedButton1Click(Sender: TObject);
var FormRoles: TFormRoles;
    i:Integer;
    ObjectAction:TObjectAction;
begin
      if (queryActions.RecordCount>0)
      then begin
                 FormRoles:=TFormRoles.Create(Self,
                                              fmMultiSelect,
                                              treeFIBDataSet.FieldByName('ID_OBJECT').value,
                                              queryActions.FieldByName('ID_ACTION').Value);
                 FormRoles.ShowModal;
                 if Assigned(FormRoles.ResultQuery)
                 then begin
                           if (FormRoles.ResultQuery.RecordCount>0)
                           then begin
                                     FormRoles.ResultQuery.FetchAll;
                                     FormRoles.ResultQuery.First;
                                     //Добавляем разрешения этим группам
                                     ObjectAction:=TObjectAction.Create(self,DMMain.KruAccessDB);

                                     for i:=0 to FormRoles.ResultQuery.RecordCount-1 do
                                     begin
                                          if not rolesDataSet.Locate('ID_OBJECT;ID_ACTION;ID_ROLE',
                                          VarArrayOf([
                                          treeFIBDataSet.FieldByName('ID_OBJECT').value,
                                          queryActions.FieldByName('ID_ACTION').Value,
                                          FormRoles.ResultQuery.FieldByName('ID_ROLE').value]),
                                          [])
                                          then begin
                                                    ObjectAction.ActionID:=queryActions.FieldByName('ID_ACTION').Value;
                                                    ObjectAction.AddPermission(treeFIBDataSet.FieldByName('ID_OBJECT').value,
                                                    FormRoles.ResultQuery.FieldByName('ID_ROLE').value);
                                          end;
                                          FormRoles.ResultQuery.Next;
                                     end;
                                     rolesDataSet.CloseOpen(true);
                                     ObjectAction.Free;
                           end;
                 end;
                 FormRoles.Free;
      end;
end;

procedure TFormObjectActions.SpeedButton2Click(Sender: TObject);
var
   FormActions: TFormActions;
   i:Integer;
   ObjectAction:TObjectAction;
begin
     if (treeFIBDataSet.RecordCount>0)
     then begin
               FormActions := TFormActions.Create(Self, fmMultiSelect,treeFIBDataSet.FieldByName('ID_OBJECT').value);
               FormActions.ShowModal;
               if Assigned(FormActions.ResultQuery)
               then begin
                         if (FormActions.ResultQuery.RecordCount>0)
                         then begin
                                   //Добавляем допустимые действия этому объекту
                                   FormActions.ResultQuery.FetchAll;
                                   FormActions.ResultQuery.First;

                                   ObjectAction:=TObjectAction.Create(self,DMMain.KruAccessDB);

                                   for i:=0 to FormActions.ResultQuery.RecordCount-1 do
                                   begin
                                        if not queryActions.Locate('ID_OBJECT;ID_ACTION',
                                        VarArrayOf([
                                        treeFIBDataSet.FieldByName('ID_OBJECT').value,
                                        FormActions.ResultQuery.FieldByName('ID_ACTION').value]),
                                        [])
                                        then begin
                                                  ObjectAction.ActionID:=FormActions.ResultQuery.FieldByName('ID_ACTION').value;
                                                  ObjectAction.InsertActionInObject(treeFIBDataSet.FieldByName('ID_OBJECT').value);
                                        end;
                                        FormActions.ResultQuery.Next;
                                   end;
                                   ObjectAction.Free;
                                   queryActions.CloseOpen(true);
                         end;

               end;
               FormActions.Free;
     end;
end;

procedure TFormObjectActions.ToolButton4Click(Sender: TObject);
var id_object:integer;
begin
     id_object:=-1;
     ObjectTreeList.BeginUpdate;
     if treeFIBDataSet.RecordCount>0
     then  id_object:=treeFIBDataSet.FieldByName('id_object').value;
     treeFIBDataSet.Close;
     treeFIBDataSet.SelectSQL.Text:='Select * from OBJECTS_SELECT('+VarToStr(Systems. EditValue)+','+VarToStr(Groups.EditValue)+','+VarToStr(Users.EditValue)+')';
     treeFIBDataSet.Open;
     treeFIBDataSet.Locate('ID_OBJECT',id_object,[]);
     ObjectTreeList.EndUpdate;
end;

procedure TFormObjectActions.SpeedButton3Click(Sender: TObject);
var sqlDelActionFromObj: TIBSQL;
    sql: string;
begin
     if (rolesDataSet.RecordCount>0)
     then begin
                if messageBox(self.Handle,'Ви дійсно хочете видалити запис?','Увага!',MB_YESNO or MB_ICONQUESTION)=mrYes
                then begin
                          sqlDelActionFromObj := TIBSQL.Create(nil);
                          sqlDelActionFromObj.Database := DMMain.KruAccessDB;
                          sqlDelActionFromObj.Transaction := DMMain.WriteTransaction;

                          DMMain.WriteTransaction.StartTransaction;
                          sql := 'delete from permissions where id_object = ' + treeFIBDataSet.FieldByName('ID_OBJECT').AsString +
                          ' and id_action = ' + queryActions.FieldByName('ID_ACTION').AsString+
                          ' and id_role   = ' + rolesDataSet.FieldByName('ID_ROLE').AsString;
                          sqlDelActionFromObj.SQL.Text := sql;
                          sqlDelActionFromObj.ExecQuery;
                          DMMain.WriteTransaction.Commit;
                          sqlDelActionFromObj.Free;
                          rolesDataSet.CloseOpen(true);
                end;
     end;
end;

procedure TFormObjectActions.FormResize(Sender: TObject);
begin
     TreeObjectPanel.Width:=2*(self.ClientWidth div 3);
     ActionRolePanel.Width:=(self.ClientWidth div 3);
     Splitter3.Top:=self.ClientHeight-100;
end;

procedure TFormObjectActions.ObjectTreeListExpanded(Sender: TObject;
  ANode: TcxTreeListNode);
begin
     ObjectTreeList.FocusedNode:=ANode;
end;

procedure TFormObjectActions.SpeedButton4Click(Sender: TObject);
var ObjectAction:TObjectAction;
begin
     if (queryActions.RecordCount>0)
     then begin
               if (rolesDataSet.RecordCount>0)
               then begin
                         MessageBox(self.Handle,'Не можна видали дію, бо є залежні записи.','Увага?',MB_OK or MB_ICONWARNING);
               end
               else begin
                         if MessageBox(self.Handle,'Ви дійсно хочете видалити дію?','Увага?',MB_YESNO or MB_ICONQUESTION)=mrYes
                         then begin
                                   ObjectAction:=TObjectAction.Create(self,DMMain.KruAccessDB);
                                   ObjectAction.ActionID:=queryActions.FieldByName('ID_ACTION').Value;
                                   ObjectAction.DeleteFromObject(treeFIBDataSet.FieldByName('ID_OBJECT').Value);
                                   ObjectAction.free;
                                   queryActions.CloseOpen(true);
                         end;
               end;
     end;
end;

procedure TFormObjectActions.ObjectTreeListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key=VK_RIGHT
     then begin
               ObjectTreeList.FocusedNode.Expand(true);
     end;
     if key=VK_LEFT
     then begin
               ObjectTreeList.FocusedNode.Collapse(true);
     end;

end;

procedure TFormObjectActions.ToolButton2Click(Sender: TObject);
var  T:TFormAddObject;
     ParentObject:TAccessObject;
     id_object:Integer;
begin
     ParentObject:=TAccessObject.Create(DMMain.KruAccessDB);
     ParentObject.ParentObjectID:=treeFIBDataSet.FieldByName('ID_OBJECT').Value;

     T:=TFormAddObject.Create(self,ParentObject,fmAdd);
     T.Systems.Properties.ListSource:=SysDataSource;
     T.Systems.Properties.KeyFieldNames :=Systems.Properties.KeyFieldNames;
     T.Systems.Properties.ListColumns   :=Systems.Properties.ListColumns;
     T.Systems.Properties.ListFieldNames:=Systems.Properties.ListFieldNames;
     T.Systems.EditValue:=Systems.EditValue;

     if T.ShowModal=mrOk
     then begin
                id_object:=T.FResultObject.ObjectID;
                treeFIBDataSet.Close;
                treeFIBDataSet.SelectSQL.Text:='Select * from OBJECTS_SELECT('+VarToStr(Systems.EditValue)+','+VarToStr(Groups.EditValue)+','+VarToStr(Users.EditValue)+')';
                treeFIBDataSet.Open;
                treeFIBDataSet.Locate('ID_OBJECT',id_object,[]);
                ObjectTreeList.FocusedNode.Expand(false);
     end;
     T.Free;
     ParentObject.Free;
end;

procedure TFormObjectActions.ToolButton1Click(Sender: TObject);
var  T:TFormAddObject;
     ParentObject:TAccessObject;
     id_object:Integer;
begin
    if (treeFIBDataSet.RecordCount>0)
    then begin
         ParentObject:=TAccessObject.Create(DMMain.KruAccessDB);
         id_object:=treeFIBDataSet.FieldByName('ID_OBJECT').Value;
         ParentObject.ObjectID:=treeFIBDataSet.FieldByName('ID_OBJECT').Value;
         ParentObject.ParentObjectID:=treeFIBDataSet.FieldByName('ID_PARENT').Value;
         ParentObject.ObjectFullName:=treeFIBDataSet.FieldByName('FULL_NAME').AsString;
         ParentObject.ObjectName    :=treeFIBDataSet.FieldByName('NAME').AsString;

         T:=TFormAddObject.Create(self,ParentObject,fmEdit);
         T.EditFullName.Text:=treeFIBDataSet.FieldByName('FULL_NAME').AsString;
         T.EditName.Text    :=treeFIBDataSet.FieldByName('NAME').AsString;
         T.Systems.EditValue:=treeFIBDataSet.FieldByName('ID_SYS').AsInteger;
         T.Systems.Properties.ListSource:=SysDataSource;
         T.Systems.Properties.KeyFieldNames :=Systems.Properties.KeyFieldNames;
         T.Systems.Properties.ListColumns   :=Systems.Properties.ListColumns;
         T.Systems.Properties.ListFieldNames:=Systems.Properties.ListFieldNames;

         if T.ShowModal=mrOk
         then begin

                    treeFIBDataSet.Close;
                    treeFIBDataSet.SelectSQL.Text:='Select * from OBJECTS_SELECT('+VarToStr(Systems. EditValue)+','+VarToStr(Groups.EditValue)+','+VarToStr(Users.EditValue)+')';
                    treeFIBDataSet.Open;
                    treeFIBDataSet.Locate('ID_OBJECT',id_object,[]);
         end;
         T.Free;
         ParentObject.Free;
    end;
end;

procedure TFormObjectActions.ToolButton3Click(Sender: TObject);
var
  id_parent:Integer;
  DeleteSP:TpFibStoredProc;
begin
     if (treeFIBDataSet.RecordCount>0)
     then begin
               if MessageBox(self.Handle,'Ви хочете видали запис?','Увага?',MB_YESNO or MB_ICONQUESTION)=mrYes
               then begin
                         if ObjectTreeList.FocusedNode.HasChildren
                         or (queryActions.RecordCount>0)
                         then begin
                                   MessageBox(self.Handle,
                                              'Не можна видалити запис, бо від нього є залежні!',
                                              'Увага?',MB_OK or MB_ICONERROR);
                         end
                         else begin
                                   DeleteSP:=TpFibStoredProc.Create(self);
                                   DeleteSP.Database:=DMMain.WorkDatabase;
                                   DeleteSP.Transaction:=DMMain.FWriteTransaction;
                                   DMMain.FWriteTransaction.StartTransaction;
                                   DeleteSP.StoredProcName:='DELETE_OBJECT';
                                   DeleteSP.Prepare;
                                   id_parent:=treeFIBDataSet.FieldByName('ID_PARENT').AsInteger;
                                   DeleteSP.ParamByName('ID_OBJECT').Value:=treeFIBDataSet.FieldByName('ID_OBJECT').AsInteger;
                                   DeleteSP.ExecProc;
                                   DeleteSP.Free;
                                   DMMain.FWriteTransaction.Commit;

                                   treeFIBDataSet.Close;
                                   treeFIBDataSet.SelectSQL.Text:='Select * from OBJECTS_SELECT('+VarToStr(Systems. EditValue)+','+VarToStr(Groups.EditValue)+','+VarToStr(Users.EditValue)+')';
                                   treeFIBDataSet.Open;
                                   treeFIBDataSet.Locate('ID_OBJECT',id_parent,[]);

                                   ObjectTreeList.FocusedNode.Expand(false);
                         end;
               end;
     end;
end;

procedure TFormObjectActions.FormShow(Sender: TObject);
var IniFile:TIniFile;
begin
     IniFile:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
     if IniFile.ReadString('Params','DeveloperMode','F')='F'
     then begin
                ToolButton1.Enabled:=false;
                ToolButton2.Enabled:=false;
                ToolButton3.Enabled:=false;                                
     end;
end;

procedure TFormObjectActions.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TFormObjectActions.SystemsPropertiesCloseUp(Sender: TObject);
begin
     ToolButton4.OnClick(self);
end;

procedure TFormObjectActions.FormCreate(Sender: TObject);
var PBarLocate:TZBarLocate;
begin
 PBarLocate:=TZBarLocate.Create(BarManager);

 PBarLocate.DataSet := treeFIBDataSet;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('NAME',
                           'Найменування',
                           [loCaseInsensitive]);
 //PBarLocate.FieldSelectVisible:=false;
 PBarLocate.DockControl  := BarDockLocate;
end;


procedure TFormObjectActions.GroupsPropertiesChange(Sender: TObject);
begin
    TextEditGroup.Hint := Groups.Text;
    TextEditGroup.Text := Groups.Text;
    if Self.Visible then ToolButton4.OnClick(self);
    if treeFIBDataSet.Active then FilterPropertiesChange;
{    queryActions.Close;
    if Groups.EditValue=-1 then
    begin
        queryActions.SelectSQL.Text:='select a.*, oa.id_object '+
                                     '  from actions a, objects_actions oa   '+
                                     ' where a.id_action=oa.id_action '+
                                     '   and oa.id_object=?id_object';
    end else begin
        queryActions.SelectSQL.Text:='select a.*, p.id_object '+
                                   '  from actions a, permissions p  '+
                                   ' where a.id_action=p.id_action '+
                                   '   and p.id_object=?id_object  '+
                                   '   and p.id_role='+inttostr(Groups.EditValue);
        rolesDataSet.Close;
        rolesDataSet.SelectSQL.Text:='select p.*, r.name, r.full_name     '+
                                     '  from permissions p, roles r       '+
                                     ' where p.id_object =?id_object      '+
                                     '   and p.id_action =?id_action      '+
                                     '   and p.id_role = r.id_role       '+
                                     '   and r.id_role = '+IntToStr(Groups.EditValue);
        rolesDataSet.Open;
    end;
    queryActions.Open;   }
end;

procedure TFormObjectActions.SystemsPropertiesChange(Sender: TObject);
begin
    Systems.Hint := Systems.Text;       
end;

procedure TFormObjectActions.UsersPropertiesChange(Sender: TObject);
var
  DS    :TpFIBDataSet;
  str   :string;
begin
    TextEditUser.Hint := Users.Text;
    TextEditUser.Text := Users.Text;
    if Self.Visible then ToolButton4.OnClick(self);
    if treeFIBDataSet.Active then FilterPropertiesChange;
{    rolesDataSet.Close;
    queryActions.Close;
    if Users.EditValue=-1 then
    begin
        queryActions.SelectSQL.Text:='select a.*, oa.id_object '+
                                     '  from actions a, objects_actions oa   '+
                                     ' where a.id_action=oa.id_action '+
                                     '   and oa.id_object=?id_object';

        rolesDataSet.SelectSQL.Text:='select p.*, r.name, r.full_name     '+
                                     '  from permissions p, roles r       '+
                                     ' where p.id_object =?id_object      '+
                                     '   and p.id_action =?id_action      '+
                                     '   and p.id_role   =r.id_role';
    end else begin
        DS:=TpFIBDataSet.Create(Self);
        DS.Database:=DMMain.WorkDatabase;
        DS.SelectSQL.Text:='select ur.id_role '+
                           ' from ACCESS_USER_SELECT us, USERS_ROLES ur '+
                           ' where ur.id_user=us.id_user '+
                           '   and us.id_user='+inttostr(Users.EditValue);
        DS.Open;
        DS.First;
        while not DS.Eof do
        begin
            str := str + IntToStr(DS.FieldByName('ID_ROLE').AsInteger)+',';
            DS.Next;
        end;
        if DS.IsEmpty then str:='-1)'
        else str[Length(str)]:=')';
        DS.Free;

        queryActions.SelectSQL.Text:='select distinct a.*, p.id_object '+
                                   '  from actions a, permissions p             '+
                                   ' where a.id_action=p.id_action '+
                                   '   and p.id_object=?id_object  '+
                                   '   and p.id_role in ('+str;
        rolesDataSet.SelectSQL.Text:='select p.*, r.name, r.full_name     '+
                                   '  from permissions p, roles r       '+
                                   ' where p.id_object =?id_object      '+
                                   '   and p.id_action =?id_action      '+
                                   '   and p.id_role   =r.id_role       '+
                                   '   and p.id_role in ('+str;
    end;
    queryActions.Open;
    rolesDataSet.Open;   }
end;

procedure TFormObjectActions.FilterPropertiesChange;
var
  DS        :TpFIBDataSet;
  str_role  :string;
  f         :Boolean;
begin                        
    rolesDataSet.Close;
    queryActions.Close;

    rolesDataSet.SelectSQL.Text:='select distinct p.*, r.name, r.full_name     '+
                                 '  from permissions p, roles r       '+
                                 ' where p.id_object =?id_object      '+
                                 '   and p.id_action =?id_action      '+
                                 '   and p.id_role   =r.id_role ';
    if (Users.EditValue=-1) and (Groups.EditValue=-1) then
    begin
        queryActions.SelectSQL.Text:='select a.*, oa.id_object '+
                                     '  from actions a, objects_actions oa   '+
                                     ' where a.id_action=oa.id_action '+
                                     '   and oa.id_object=?id_object ';
    end else begin
        queryActions.SelectSQL.Text:='select distinct a.*, p.id_object '+
                                     '  from actions a, permissions p  '+
                                     ' where a.id_action=p.id_action '+
                                     '   and p.id_object=?id_object ';
    end;
    if Groups.EditValue<>-1 then str_role:=' and p.id_role = '+inttostr(Groups.EditValue);
    if (Users.EditValue<>-1) and (Groups.EditValue=-1) then
    begin
        DS:=TpFIBDataSet.Create(Self);
        DS.Database:=DMMain.WorkDatabase;
        DS.SelectSQL.Text:='select ur.id_role '+
                           ' from ACCESS_USER_SELECT us, USERS_ROLES ur '+
                           ' where ur.id_user=us.id_user '+
                           '   and us.id_user='+inttostr(Users.EditValue);
        DS.Open;
        DS.First;
        str_role := ' and p.id_role in (';
        while not DS.Eof do
        begin
            str_role := str_role + IntToStr(DS.FieldByName('ID_ROLE').AsInteger)+',';
            if DS.FieldByName('ID_ROLE').AsInteger = Groups.EditValue then f:=True;
            DS.Next;
        end;
        if DS.IsEmpty then str_role:=' and p.id_role=-1'
        else str_role[Length(str_role)]:=')';
        DS.Free;
    end;
    queryActions.SelectSQL.Text := queryActions.SelectSQL.Text + str_role;
    rolesDataSet.SelectSQL.Text := rolesDataSet.SelectSQL.Text + str_role;

    queryActions.Open;
    rolesDataSet.Open;
end;

procedure TFormObjectActions.TextEditUserClick(Sender: TObject);
begin
    Users.SetFocus;
end;

procedure TFormObjectActions.TextEditGroupClick(Sender: TObject);
begin
    Groups.SetFocus;
end;

procedure TFormObjectActions.ToolButtonPrintClick(Sender: TObject);
var
  str: string;
  ids: array of Integer;
  n,i: Integer;
  t: Integer;
begin
    Screen.Cursor := crHourGlass;
    n:=0;
    SetLength(ids,10);
    ids[0]:=-1;
    ObjectTreeList.BeginUpdate;
    treeFIBDataSet.First;
    while not treeFIBDataSet.Eof do
    begin
        if treeFIBDataSet.FieldByName('koren').AsString='T' then
        begin
            t := treeFIBDataSet.FieldByName('ID_PARENT').AsInteger;
            i := 0;
            while (i<n) and (ids[i]<>t) do Inc(i);
            if i=n then
            begin
                str := str + IntToStr(t) + ',';
                Inc(n);
                if Length(ids)<n then SetLength(ids,n+10);
                ids[i] := t;
            end;
        end;
        treeFIBDataSet.Next;
    end;
    ObjectTreeList.EndUpdate;

    if Length(str)>0 then
    begin
        str[Length(str)]:=')';

        DataSetPrint.Close;
        str := 'select A.id_object, A.out_full_name, A.out_name, A.out_short_name, A.out_level, A.out_prefics '+
                              ' from ACCESS_OBJ_ACT_PRINT (''('+str+''','+
                              IntToStr(Systems.EditValue)+','+
                              IntToStr(Groups.EditValue)+','+
                              IntToStr(Users.EditValue)+') A';
        DataSetPrint.SelectSQL.Text := str;
        DataSetPrint.Open;
        DataSetPrint.FetchAll;

        DataSetPrintAction.Close;
        DataSetPrintAction.SelectSQL.Text:=queryActions.SelectSQL.Text;
        DataSetPrintAction.Open;

        DataSetPrintRole.Close;
        DataSetPrintRole.SelectSQL.Text:=rolesDataSet.SelectSQL.Text;
        DataSetPrintRole.Open;

        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Objects&Actions.fr3',True);
        if frxReport1.PrepareReport then frxReport1.ShowPreparedReport;
    end;
    Screen.Cursor := crDefault;
end;


procedure TFormObjectActions.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
    if VarName='OBJECT' then Value:=Systems.Text;
    if VarName='ROLE'   then Value:=Groups.Text;
    if VarName='USER'   then Value:=Users.Text;
end;

procedure TFormObjectActions.PrintExecute(Sender: TObject);
begin
    ToolButtonPrintClick(sender);
end;


end.
