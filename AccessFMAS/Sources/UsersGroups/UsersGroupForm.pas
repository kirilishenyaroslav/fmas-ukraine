unit UsersGroupForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Grids, DBGrids, ToolWin, Db, IBCustomDataSet, IBQuery,
  MainDM, ActnList, AddRole, AddUser, User, Role, RolesForm,
  Placemnt,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  frxClass, frxDBSet, FIBDataSet, pFIBDataSet, pFIBQuery;

type
  TFormUsersGroup = class(TForm)
    ToolBarGroupUser: TToolBar;
    TabControlGroupUser: TTabControl;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    DataSourceMain: TDataSource;
    DataSourceDetail: TDataSource;
    ActionListUsersGroup: TActionList;
    Add: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    DelFrom: TAction;
    AddTo: TAction;
    Edit: TAction;
    DeleteButton: TToolButton;
    FormStorage1: TFormStorage;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1: TcxGrid;
    DBGridDetail: TcxGridDBTableView;
    detail_NAME: TcxGridDBColumn;
    detail_FULL_NAME: TcxGridDBColumn;
    detail_ID: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DBGridMain: TcxGridDBTableView;
    NAME: TcxGridDBColumn;
    FULL_NAME: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Print: TToolButton;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    DSetMain: TpFIBDataSet;
    DSetDetail: TpFIBDataSet;
    ID: TcxGridDBColumn;
    Esc: TAction;
    Del: TAction;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabControlGroupUserChange(Sender: TObject);
    procedure AddExecute(Sender: TObject);
    procedure EditExecute(Sender: TObject);
    procedure AddToExecute(Sender: TObject);
    procedure DelFromExecute(Sender: TObject);
    procedure DeleteExecute(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String; var Value: Variant);
    procedure DSetMainAfterScroll(DataSet: TDataSet);
    constructor Create(Owner: TComponent)overload;
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses UsersForm;

{$R *.DFM}

constructor TFormUsersGroup.Create(Owner: TComponent);
begin
    inherited Create(Owner);
    TabControlGroupUserChange(self);
end;

procedure TFormUsersGroup.DSetMainAfterScroll(DataSet: TDataSet);
var
  sql :string;
begin
    DSetDetail.Close;
    if TabControlGroupUser.TabIndex = 0 then
         sql := 'select u.*,  ur.id_role'+
               ' from ACCESS_USER_SELECT u, users_roles ur'+
               ' where ur.id_user = u.id_user'+
               ' and ur.id_role = ?ID_ROLE'
    else sql := 'select r.*,  ur.id_user'+
               ' from roles r, users_roles ur'+
               ' where ur.id_role = r.id_role'+
               ' and ur.id_user = ?ID_USER';
    DSetDetail.SelectSQL.Text := sql;
    try DSetDetail.Open;
    except
         on exc: Exception do
         begin
              ShowErrorMessage('Помилка у запиті! '+exc.Message+' '+sql+' ');
              exc.Free;
         end;
    end;      
end;

procedure TFormUsersGroup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormUsersGroup.TabControlGroupUserChange(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    DSetMain.Close;
    if TabControlGroupUser.TabIndex = 0 then
    begin
      ToolButton1.ImageIndex := 3;
      ID.DataBinding.FieldName := 'ID_ROLE';
      ID.Caption:='ID_ROLE';
      detail_ID.DataBinding.FieldName := 'ID_USER';
      DSetMain.SelectSQL.Text := 'select r.* from roles r order by r.NAME'
    end else begin
      ToolButton1.ImageIndex := 2;
      ID.DataBinding.FieldName := 'ID_USER';
      ID.Caption:='ID_USER';
      detail_ID.DataBinding.FieldName := 'ID_ROLE';
      DSetMain.SelectSQL.Text := 'select * from ACCESS_USER_SELECT';
    end;

    try
        DSetMain.Open;
        DSetMain.FetchAll;
    except
        on exc: Exception do
        begin
            ShowErrorMessage('Помилка у запиті! '+exc.Message+' '+DSetMain.SelectSQL.Text+' ');
            exc.Free;
        end;
    end;
    Screen.Cursor := crDefault;
end;

procedure TFormUsersGroup.AddExecute(Sender: TObject);
var
  FormAddRole: TFormAddRole;
  FormAddUser: TFormAddUser;
begin
    if TabControlGroupUser.TabIndex = 0 then
    begin
        //Добавляем группу
        FormAddRole := TFormAddRole.Create(Self, nil, fmAdd);
        FormAddRole.ShowModal;
        if Assigned(FormAddRole.FResultRole) then
        begin
            Screen.Cursor := crHourGlass;
            DSetMain.CloseOpen(True);
            DSetMain.Locate('ID_ROLE', FormAddRole.FResultRole.RoleID,[]);
            Screen.Cursor := crDefault;
        end;
        FormAddRole.Free;
    end else begin
      //Добавляем пользователя
        FormAddUser := TFormAddUser.Create(Self, nil, fmAdd);
        if FormAddUser.ShowModal = mrOk then
        begin
            Screen.Cursor := crHourGlass;
            DSetMain.CloseOpen(True);
            DSetMain.Locate('ID_USER', FormAddUser.id_user, []);
            Screen.Cursor := crDefault;
        end;
        FormAddUser.Free;
    end;
end;

procedure TFormUsersGroup.EditExecute(Sender: TObject);
var
  FormAddRole: TFormAddRole;
  FormAddUser: TFormAddUser;
  theUser: TUser;
  theRole: TRole;
  b: Boolean;
begin
  if DSetMain.RecordCount > 0 then
  begin
    if TabControlGroupUser.TabIndex = 0 then
    begin
      //Редактируем группу
      theRole := TRole.Create(Self, DMMain.KruAccessDB{, queryMain});
      b:=theRole.FillDataBy(DSetMain.FieldbyName('id_role').AsVariant);
      if b then
      begin
        FormAddRole := TFormAddRole.Create(Self, theRole, fmEdit);
        FormAddRole.ShowModal;

        if Assigned(FormAddRole.FResultRole) then
        begin
          Screen.Cursor := crHourGlass;
          DSetMain.CloseOpen(True);
          DSetMain.Locate('ID_ROLE', FormAddRole.FResultRole.RoleID,[]);
          Screen.Cursor := crDefault;
        end;

        FormAddRole.Free;
      end;
      theRole.Free;
    end else begin
      //Редактируем пользователя
      theUser := TUser.Create(Self, DMMain.KruAccessDB{, queryMain});

      if theUser.FillDataBy(DSetMain.FieldByName('id_user').AsVariant) then
      begin
        FormAddUser := TFormAddUser.Create(Self, theUser, fmEdit);
        FormAddUser.id_user := theUser.UserId;
        FormAddUser.id_pcard := theUser.UserIDExt;

        if FormAddUser.ShowModal = mrOk then
        begin
          Screen.Cursor := crHourGlass;
          DSetMain.CloseOpen(True);
          DSetMain.Locate('ID_USER', FormAddUser.Id_User,[]);
          Screen.Cursor := crDefault;
        end;

        FormAddUser.Free;
      end;
      theUser.Free;
    end;
  end;
end;

procedure TFormUsersGroup.AddToExecute(Sender: TObject);
var
  FormRoles: TFormRoles;
  FormUsers: TFormUsers;
  querySelected: TpFIBDataSet;
  theRole: TRole;
  theUser: TUser;
begin
  querySelected := TpFIBDataSet.Create(Self);
  querySelected.Database := DMMain.WorkDatabase;

  if TabControlGroupUser.TabIndex = 0 then
  begin
      // Добавляем пользователей в группу
      FormUsers := TFormUsers.Create(Self, fmMultiSelect);
      FormUsers.ResultQuery := querySelected;
      FormUsers.ShowModal;
      //FormUsers.Free;

      if (FormUsers.ResultQuery.Active) and (FormUsers.ResultQuery.RecordCount > 0) then
      begin
          theRole := TRole.Create(Self, DMMain.KruAccessDB);
          if theRole.FillDataBy(DSetMain.FieldByName('id_role').AsVariant) then
          begin
              FormUsers.ResultQuery.FetchAll;
              FormUsers.ResultQuery.First;
              while not FormUsers.ResultQuery.Eof do
              begin
                  DSetDetail.First;
                  if not DSetDetail.Locate('id_user',FormUsers.ResultQuery.FieldByName('id_user').Value,[]) then
                  begin
                      if not theRole.AddUserToRole(FormUsers.ResultQuery.FieldByName('id_user').AsInteger) then
                        ShowErrorMessage('Не вдалось додати користувача до групи '+
                                         FormUsers.ResultQuery.FieldByName('name').AsString);
                  end;
                  FormUsers.ResultQuery.Next;
              end;
          end
          else ShowErrorMessage('Не вдалось отримати дані про групу!');
          theRole.Free;
      end;
      FormUsers.Free;
  end else begin
      //Добавляем группы пользователю
      FormRoles := TFormRoles.Create(Self, fmMultiSelect,-1,-1);
      FormRoles.ResultQuery := querySelected;
      FormRoles.ShowModal;

      if (FormRoles.ResultQuery.Active) and (FormRoles.ResultQuery.RecordCount > 0) then
      begin
          FormRoles.ResultQuery.FetchAll;
          FormRoles.ResultQuery.First;
          theUser := TUser.Create(Self, DMMain.KruAccessDB);
          if theUser.FillDataBy(DSetMain.FieldByName('id_user').AsVariant) then
          begin
              FormRoles.ResultQuery.First;
              while not FormRoles.ResultQuery.Eof do
              begin
                  DSetDetail.First;
                  if not DSetDetail.Locate('id_role',FormRoles.ResultQuery.FieldByName('id_role').Value,[]) then
                  begin
                      if not theUser.AddUserToRole(FormRoles.ResultQuery.FieldByName('id_role').AsInteger) then
                        ShowErrorMessage('Не вдалось додатикористувача до групи '+
                                         FormRoles.ResultQuery.FieldByName('name').AsString);
                  end;
                  FormRoles.ResultQuery.Next;
              end;
          end
          else ShowErrorMessage('Не вдалось отримати дані про користувача!');
          theUser.Free;
      end;

      FormRoles.Free;
  end;

  DSetDetail.CloseOpen(True);
  querySelected.Free;
end;

procedure TFormUsersGroup.DelFromExecute(Sender: TObject);
var
  theRole: TRole;
  theUser: TUser;
begin
//    if DBGridDetail.Focused and (queryMain.RecordCount > 0) and (queryDetail.RecordCount > 0) then
    if DBGridDetail.Focused and (DSetMain.RecordCount > 0) and (DSetDetail.RecordCount > 0) then
    begin
        if TabControlGroupUser.TabIndex = 0 then
        begin
            //Удаляем пользователя из группы
            if MessageDlg('Вилучити користувача з групи?',mtConfirmation,[mbYes, mbNo], 0)=ID_NO then exit;

            theRole := TRole.Create(Self, DMMain.KruAccessDB);
            if not (theRole.FillDataBy(DSetMain.FieldByName('id_role').AsVariant) and
              theRole.DelUserFromRole(DSetDetail.FieldByName('id_user').AsVariant)) then
              ShowErrorMessage('Не вдалося вилучити користувача з групи!');
            theRole.Free
        end else begin
            //Удаление группы из пользователя
            if MessageDlg('Вилучити групу з користувача?',mtConfirmation,[mbYes, mbNo], 0)=ID_NO then exit;

            theUser := TUser.Create(Self, DMMain.KruAccessDB);
            if not (theUser.FillDataBy(DSetMain.FieldByName('id_user').AsVariant) and
               theUser.DelUserFromRole(DSetDetail.FieldByName('id_role').AsVariant)) then
               ShowErrorMessage('Не вдалося вилучити групу користувача!');
            theUser.Free
        end;
        DSetDetail.CloseOpen(True);
    end;
end;

procedure TFormUsersGroup.DeleteExecute(Sender: TObject);
var
  fibQuery :TpFIBQuery;
begin
    if DSetMain.RecordCount > 0 then
    begin
        fibQuery:=TpFIBQuery.Create(Self); 
        fibQuery.Database:=DMMain.WorkDatabase;
        if TabControlGroupUser.TabIndex = 0 then
        begin
            //Удаляем группу
            if MessageDlg('Вилучити вибрану групу?',mtConfirmation,[mbYes, mbNo], 0)=ID_NO then exit;

            fibQuery.Close;
            fibQuery.Transaction.StartTransaction;
            fibQuery.SQL.Text := 'EXECUTE PROCEDURE ACCESS_ROLES_DELETE(' + IntToStr(DSetMain['ID_ROLE']) + ')';
            fibQuery.ExecQuery;
            fibQuery.Transaction.Commit;
            DSetMain.CloseOpen(True);

        end else begin
        //Удаляем пользователя
            if MessageDlg('Вилучити вибраного користувача?',mtConfirmation,[mbYes, mbNo], 0)=ID_NO then exit;

            fibQuery.Close;
            fibQuery.Transaction.StartTransaction;
            fibQuery.SQL.Text := 'EXECUTE PROCEDURE ACCESS_Users_DELETE(' + IntToStr(DSetMain['ID_USER']) + ')';
            fibQuery.ExecQuery;
            fibQuery.Transaction.Commit;
            DSetMain.CloseOpen(True);
        end;
        fibQuery.Free;
    end;
end;

procedure TFormUsersGroup.PrintClick(Sender: TObject);
begin
    Screen.Cursor := crHourGlass;
    DSetMain.CloseOpen(True);
    DSetDetail.CloseOpen(True);
    frxReport1.Clear;
    if frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\GroupUsersRep.fr3',true) then
    begin
        cxGrid2.BeginUpdate;
        cxGrid1.BeginUpdate;
        if frxReport1.PrepareReport(true) then
            frxReport1.ShowPreparedReport;
        cxGrid2.EndUpdate;
        cxGrid1.EndUpdate;
    end
    else ShowErrorMessage('Файл звіту "\Reports\GroupUsersRep.fr3" не знайдено!');
    Screen.Cursor := crDefault;
end;

procedure TFormUsersGroup.frxReport1GetValue(const VarName: String; var Value: Variant);
begin
    if TabControlGroupUser.TabIndex = 0 then
    begin
    if varname='Full_Name1' then value:='Повна назва';
    if varname='Full_Name2' then value:='П.І.Б.';
    if varname='Name1' then value:='Назва';
    if varname='Name2' then value:='Логін';
    if varname='REP_TITLE' then value:='Групи';
    end else begin
    if varname='Full_Name2' then value:='Повна назва';
    if varname='Full_Name1' then value:='П.І.Б.';
    if varname='Name2' then value:='Назва';
    if varname='Name1' then value:='Логін';
    if varname='REP_TITLE' then value:='Користувачі';
    end;
end;

procedure TFormUsersGroup.EscExecute(Sender: TObject);
begin
    Close;
end;

end.

