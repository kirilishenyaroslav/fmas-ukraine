{*******************************************************************************
* uActionControl                                                               *
*                                                                              *
* Библиотека компонентов для работы с формой редактирования (qFControls)       *
* Работа с действиями (добавление, изменение и т.д. (TqFActionControl)         *
* Copyright ©  2005-2006, Олег Г. Волков, Донецкий Национальный Университет    *
*******************************************************************************}

unit uActionControl;

interface

uses
  SysUtils, Classes, Controls, pFIBDatabase, pFIBDataset, pFIBQuery,
  FIB, ActnList, uFormControl, Forms, DB;

type
  TqFFormShowEvent = procedure (Sender: TObject; Form: TForm) of object;
  TqFGetKeysEvent = procedure (Sender: TObject; var ValueString: Variant) of object;
  TqFAfterRefreshEvent = procedure (Sender: TObject; Value: Variant) of object;
  TqFCanPrepare = procedure(Sender: TObject; Mode: TFormMode; var CanPrepare: Boolean) of object;

  TqFActionControl = class(TComponent)
  private
    FDatabase: TpFIBDatabase;
    FWriteTransaction: TpFIBTransaction;

    FDeleteQuery: TpFIBQuery;
    FSelectDataset: TDataSet;

    FKeyFields: String;
    FNameField: String;
    FKeyValues: Variant;

    FRefreshAction: TAction;
    FDeleteAction: TAction;
    FAddAction: TAction;
    FModifyAction: TAction;
    FInfoAction: TAction;
    FCloneAction: TAction;

    FAddFormClass: String;

    FBeforePrepare: TqFFormShowEvent;
    FAfterPrepare: TqFFormShowEvent;
    FOnShowForm: TqFFormShowEvent;
    FAfterRefresh: TqFAfterRefreshEvent;
    FOnRefresh: TNotifyEvent;
    FAfterDelete: TNotifyEvent;

    FOnGetKeys: TqFGetKeysEvent;

    FCanEdit: TqFCanPrepare;
    FCanDelete: TqFCanPrepare;
    FBeforeDelete: TqFDatabaseEvent;

    FYesFocusOnDelete: Boolean;

    procedure FreeDBObjects;

    procedure SetDeleteSQL(SQL: TStrings);
    function GetDeleteSQL: TStrings;

    procedure SetDatabase(DB: TpFIBDatabase);

    procedure SetRefreshAction(Action: TAction);
    procedure SetDeleteAction(Action: TAction);
    procedure SetAddAction(Action: TAction);
    procedure SetModifyAction(Action: TAction);
    procedure SetInfoAction(Action: TAction);
    procedure SetCloneAction(Action: TAction);

    procedure GetKeyValues;

  public
    LastMode: TFormMode;
    AddKeys: Variant;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Refresh;
    procedure StdRefresh;
    procedure Delete(Sender: TObject);
    procedure DeleteQuery(Sender: TObject);
    procedure ShowEditForm(Mode: TFormMode);
    procedure ActionRefresh(Sender: TObject);
    procedure ActionAdd(Sender: TObject);
    procedure ActionModify(Sender: TObject);
    procedure ActionInfo(Sender: TObject);
    procedure ActionClone(Sender: TObject);

  published
    property DeleteSQL: TStrings read GetDeleteSQL write SetDeleteSQL;
    property SelectDataSet: TDataSet read FSelectDataset write FSelectDataSet;
    property KeyFields: String read FKeyFields write FKeyFields;
    property NameField: String read FNameField write FNameField;

    property RefreshAction: TAction read FRefreshAction write SetRefreshAction;
    property DeleteAction: TAction read FDeleteAction write SetDeleteAction;
    property Database: TpFIBDatabase read FDatabase write SetDatabase;

    property AddFormClass: String read FAddFormClass write FAddFormClass;

    property AddAction: TAction read FAddAction write SetAddAction;
    property ModifyAction: TAction read FModifyAction write SetModifyAction;
    property InfoAction: TAction read FInfoAction write SetInfoAction;
    property CloneAction: TAction read FCloneAction write SetCloneAction;
    property OnShowForm: TqFFormShowEvent read FOnShowForm write FOnShowForm;
    property AfterPrepare: TqFFormShowEvent read FAfterPrepare write FAfterPrepare;
    property BeforePrepare: TqFFormShowEvent read FBeforePrepare write FBeforePrepare;
    property AfterRefresh: TqFAfterRefreshEvent read FAfterRefresh write FAfterRefresh;
    property OnRefresh: TNotifyEvent read FOnRefresh write FOnRefresh;

    property OnGetKeys: TqFGetKeysEvent read FOnGetKeys write FOnGetKeys;
    property AfterDelete: TNotifyEvent read FAfterDelete write FAfterDelete;

    property CanEdit: TqFCanPrepare read FCanEdit write FCanEdit;
    property CanDelete: TqFCanPrepare read FCanDelete write FCanDelete;

    property BeforeDelete: TqFDatabaseEvent read FBeforeDelete write FBeforeDelete;

    property YesFocusOnDelete: Boolean read FYesFocusOnDelete write FYesFocusOnDelete default True; 
  end;
  
procedure Register;
{$R *.res}

implementation

uses qFTools, qFStrings, Variants;

procedure TqFActionControl.ActionInfo(Sender: TObject);
begin
    ShowEditForm(fmInfo);
end;

procedure TqFActionControl.ActionClone(Sender: TObject);
begin
    ShowEditForm(fmClone);
end;

procedure TqFActionControl.ActionModify(Sender: TObject);
begin
    ShowEditForm(fmModify);
end;

procedure TqFActionControl.ActionAdd(Sender: TObject);
begin
    ShowEditForm(fmAdd);
end;

    // показать форму для редактирования
procedure TqFActionControl.ShowEditForm(Mode: TFormMode);
var
	form: TForm;
	fclass: TPersistentClass;
    FormControl: TqFFormControl;
    i: Integer;
    res: Boolean;
    canEdit: Boolean;
begin
    if ( Mode <> fmInfo ) and Assigned(FCanEdit) then
    begin
        FCanEdit(Self, Mode, canEdit);

        if not canEdit then Exit;
    end;

    Self.LastMode := Mode;
        // если в списке ничего нет, то и показывать нечего
        // если нет привязанного датасета, не бузить!
    if ( Mode <> fmAdd ) and
        ( (FSelectDataset <> nil ) and FSelectDataset.IsEmpty ) then
    begin
        qFErrorDialog(qFEmpty);
        Exit;
    end;

        // создать форму по имени класса
    form := nil;
    try
		fclass := GetClass(FAddFormClass);
		if fclass <> nil then
			Application.CreateForm(TFormClass(fclass),form);
	except
	end;
        // проверить, создалась она или нет
	if form = nil then
    begin
        qFErrorDialog(qFCantCreateForm);
        Exit;
    end;

        // получить ключ, по которому отбирать данные
    if Mode <> fmAdd then GetKeyValues;

        // если получить ключ не удалось, а он нужен - сказать и закрыться
    if ( Mode <> fmAdd ) and VarIsNull(FKeyValues) then
    begin
        qFErrorDialog(qFEmpty);
        form.Free;
        Exit;
    end;

        // найти управляющий элемент формы
    FormControl := nil;
    for i:=0 to form.ComponentCount-1 do
        if form.Components[i] is TqFFormControl then
        begin
            FormControl := form.Components[i] as TqFFormControl;
            break;
        end;

    if Assigned(FBeforePrepare) then FBeforePrepare(Self, form);

            // подготовить форму
    if FormControl <> nil then
    begin
        res := FormControl.Prepare(FDatabase, Mode, FKeyValues, AddKeys);
        if not res then
        begin
            form.Free;
            Exit;
        end;
    end;

        // запустить дополнительные обработчики, если есть
    if Assigned(FAfterPrepare) then FAfterPrepare(Self, form);
    if Assigned(FOnShowForm) then FOnShowForm(Self, form);

        // показать
    if form.ShowModal = mrOk then
    begin
            // получить, какую запись добавили
        if ( ( Mode = fmAdd ) or ( Mode = fmClone) ) and ( FormControl <>  nil )
            then FKeyValues := FormControl.LastId;

            // обновить список
        if Mode <> fmInfo then
            if Assigned(FOnRefresh) then
                FOnRefresh(Self)
            else StdRefresh;
    end;
    form.Free;
end;

procedure TqFActionControl.GetKeyValues;
begin
    FKeyValues := Null;
    if Assigned(FOnGetKeys) then FOnGetKeys(Self, FKeyValues)
    else
        if (FSelectDataSet <> nil ) and not FSelectDataSet.IsEmpty then
            FKeyValues := FSelectDataSet[FKeyFields];
end;

procedure TqFActionControl.DeleteQuery(Sender: TObject);
var
    canDelete: Boolean;
    confirmString: String;
begin
    if Assigned(FCanDelete) then
    begin
        FCanDelete(Self, fmDelete , canDelete);
        if not canDelete then Exit;
    end;

    if FDatabase = nil then
    begin
        qFErrorDialog(qFNoDatabase);
        Exit;
    end;

    if ( FNameField <> '' ) and ( FSelectDataset <> nil ) then
        confirmString := qFConfirmDeleteMsg + #13#10'(' + FSelectDataset[FNameField] + ')'
    else confirmString := qFConfirmDeleteMsg;

    if qFConfirmEx(confirmString, FYesFocusOnDelete) then
        Delete(Sender);
end;

procedure TqFActionControl.SetInfoAction(Action: TAction);
begin
    FInfoAction := Action;
    FInfoAction.OnExecute := ActionInfo;
end;

procedure TqFActionControl.SetModifyAction(Action: TAction);
begin
    FModifyAction := Action;
    FModifyAction.OnExecute := ActionModify;
end;

procedure TqFActionControl.SetAddAction(Action: TAction);
begin
    FAddAction := Action;
    FAddAction.OnExecute := ActionAdd;
end;

procedure TqFActionControl.SetCloneAction(Action: TAction);
begin
    FCloneAction := Action;
    FCloneAction.OnExecute := ActionClone;
end;

procedure TqFActionControl.SetDeleteAction(Action: TAction);
begin
    FDeleteAction := Action;
    FDeleteAction.OnExecute := DeleteQuery;
end;

procedure TqFActionControl.SetRefreshAction(Action: TAction);
begin
    FRefreshAction := Action;
    FRefreshAction.OnExecute := ActionRefresh;
end;

procedure TqFActionControl.Delete(Sender: TObject);
var
    origSQL, newSQL: String;
begin
    GetKeyValues;
    if VarIsNull(FKeyValues) then
    begin
        qFErrorDialog(qFGetErrorMsg);
        Exit;
    end;

    try
        FDeleteQuery.Transaction.StartTransaction;

        if Assigned(FBeforeDelete) then
            FBeforeDelete(Self, nil, fmDelete, FDeleteQuery.Transaction);


            // заменить значения ключа в запросе на удаление
        origSQL := FDeleteQuery.SQL.Text;
        newSQL := StringReplace(origSQL, ':where',
            qFVariantToString(FKeyValues), [rfReplaceAll]);

                // заменить дополнительные параметры
        if qFNotEmpty(AddKeys) then
            newSQL := StringReplace(newSQL, ':add', qFVariantToString(AddKeys),
                [rfReplaceAll]);

               // заменить идентификатор пользоваля
        newSQL := StringReplace(newSQL, ':Acc_Id_User',
            IntToStr(Acc_Id_User), [rfReplaceAll]);


        FDeleteQuery.SQL.Text := newSQL;

                // выхватить предыдущую запись
        if ( FSelectDataSet <> nil ) and not FSelectDataSet.Bof then
            FSelectDataSet.Prior;

        if Assigned(FAfterDelete) then FAfterDelete(Self);
        GetKeyValues;

        FDeleteQuery.ExecQuery;

        FDeleteQuery.SQL.Text := origSQL;

        FDeleteQuery.Transaction.Commit;
        Refresh;

    except on e: Exception do
        begin
            FDeleteQuery.Transaction.Rollback;
            FDeleteQuery.SQL.Text := origSQL;

                // проверить, не блокировка ли это
            if ( e is EFIBInterbaseError ) and
                ( (e as EFIBInterbaseError).IBErrorCode = 335544345 ) then
                 qFErrorDialog(qFLockErrorMsg)
            else qFErrorDialog(qFErrorMsg + ': ' + e.Message + '!');
        end;
    end
end;

procedure TqFActionControl.ActionRefresh(Sender: TObject);
begin
    Refresh;
end;

procedure TqFActionControl.Refresh;
begin
    if Assigned(FOnRefresh) then
        FOnRefresh(Self)
    else
    begin
        GetKeyValues;
        StdRefresh;
    end;
end;


procedure TqFActionControl.StdRefresh;
begin
//    if FDatabase = nil then Exit;

    if FSelectDataset <> nil then
    begin
        FSelectDataset.Close;
        FSelectDataset.Open;
        FSelectDataset.Locate(FKeyFields, FKeyValues, []);
    end;

    if Assigned(FAfterRefresh) then FAfterRefresh(Self, FKeyValues);
end;

procedure TqFActionControl.SetDeleteSQL(SQL: TStrings);
begin
    FDeleteQuery.SQL := SQL;
end;

function TqFActionControl.GetDeleteSQL: TStrings;
begin
    Result := FDeleteQuery.SQL;
end;

procedure TqFActionControl.SetDatabase(DB: TpFIBDatabase);
begin
    FDatabase := DB;
    FWriteTransaction.DefaultDatabase := DB;
    with FWriteTransaction.TRParams do
    begin
        Add('read_committed');
        Add('rec_version');
        Add('nowait');
    end;
    FDeleteQuery.Transaction := FWriteTransaction;
    FDeleteQuery.Database := FWriteTransaction.DefaultDatabase;
end;

procedure  TqFActionControl.FreeDBObjects;
begin
    FDeleteQuery.Free;
    FWriteTransaction.Free;
end;

destructor TqFActionControl.Destroy;
begin
    FreeDBObjects;
    inherited Destroy;
end;

constructor TqFActionControl.Create(AOwner: TComponent);
begin
    inherited Create(AOwner);

    FWriteTransaction := TpFIBTransaction.Create(nil);

    FDeleteQuery := TpFIBQuery.Create(nil);

    FYesFocusOnDelete := True;
end;

procedure Register;
begin
  RegisterComponents('qFControls', [TqFActionControl]);
end;

end.
