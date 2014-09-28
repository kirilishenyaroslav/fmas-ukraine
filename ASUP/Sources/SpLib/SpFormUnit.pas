
{ -$Id: SpFormUnit.pas,v 1.2 2005/07/21 17:23:05 oleg Exp $}
{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{                 Модуль "Универсальная справочная форма"                      }
{               Базовая форма для работы с линейными справочниками             }
{                                                  ответственный: Олег Волков  }

unit SpFormUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, IBCustomDataSet, IBTable, Grids, DBGrids, IBQuery,IBDataBase,
  DBCtrls, Mask, Buttons, ExtCtrls, ComCtrls, ToolWin, SpCommon, SpPrintDataUnit,
  uSearchFrame;

type
  TSpParams=class(TPersistent)
   private
	FTable: String;
	FIdField: String;
	FSpFields:String;
	FComboField:String;
	FTitle: String;
	FAdditional: String;
	FColumnNames:String;
	FReadOnly: Boolean;
	FSelectProcName: String;
	FInsertProcName: String;
	FUpdateProcName: String;
	FDeleteProcName: String;
	FDontHideFirst: Boolean;
	FSpMode: TSpMode;
	FAddFormName: String;
   public
	function MakeSelectSQL: String;
	function MakePrepareSQL(id: Integer): String;
   published
	property Table:String read FTable write FTable;
	property IdField:String read FIdField write FIdField;
	property SpFields:String read FSpFields write FSpFields;
	property Title: String read FTitle write FTitle;
	property ComboField:String read FComboField write FComboField;
	property ColumnNames:String read FColumnNames write FColumnNames;
	property ReadOnly: Boolean read FReadOnly write FReadOnly default False;
	property SelectProcName: String read FSelectProcName write FSelectProcName;
	property InsertProcName: String read FInsertProcName write FInsertProcName;
	property UpdateProcName: String read FUpdateProcName write FUpdateProcName;
	property DeleteProcName: String read FDeleteProcName write FDeleteProcName;
	property DontHideFirstColumn: Boolean
		read FDontHideFirst write FDontHideFirst;
	property AdditionalField: String read FAdditional write FAdditional;
	property SpMode: TSpMode read FSpMode write FSpMode default spmNormal;
	property AddFormName: String read FAddFormName write FAddFormName;
    end;

  TSpForm = class(TForm)
    TopPanel: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    FindButton: TSpeedButton;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SpGrid: TDBGrid;
    DetailsButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    PrintButton: TSpeedButton;
    SearchFrame: TfmSearch;
    procedure DeleteButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure SpGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpGridDblClick(Sender: TObject);
    procedure SpGridKeyPress(Sender: TObject; var Key: Char);
    procedure FindButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpGridCellClick(Column: TColumn);
    procedure DetailsButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure SpGridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PrintButtonClick(Sender: TObject);
  protected
	Params: TSpParams;
	DblClick: Boolean;
	procedure DoShowChangeForm(Mode: TEditMode);virtual;
  public
	constructor Create(AOwner: TComponent);override;
	procedure Init(SpParams: TSpParams);virtual;
	procedure Refresh;virtual;
	procedure PrepareColumns;
  published
	SpDataSource:	TDataSource;
	ResultQuery:	TIBQuery;
	WorkQuery: TIBQuery;
    procedure AddButtonClick(Sender: TObject);

  end;

var
  SpForm: TSpForm;

implementation

{$R *.DFM}

	// возвратить первый элемент из списка через запятую
function GetFirstField(s: String): String;
var
	comma: Integer;
begin
	comma := Pos(',',s);
	if comma>0 then Result := Copy(s,1,comma-1)
	else	Result := s;
end;

procedure TSpForm.Refresh;
begin
	QueryRefresh(ResultQuery);
   // AllLabel.Caption := 'усього: ' + IntToStr(ResultQuery.RecordCount);

	if ResultQuery.DefaultFields then PrepareColumns;

	GridResize(SpGrid);

	SearchFrame.SearchEdit.Text := '';
end;

	// подготовить столбцы - только для тех, что создаются по умолчанию
procedure TSpForm.PrepareColumns;
var
	i, col: Integer;
	S: String;
begin
	if Params <> nil then
	with Params do
	begin
			// спрятать первый столбец, если нужно
		if not FDontHideFirst then
		begin
			SpGrid.Columns[0].Visible := False;
			col := 1;
		end
		else col := 0;

			// поименовать столбцы по ColumnNames
		S:='';
		for i:=1 to Length(ColumnNames) do
		if ColumnNames[i] = ',' then
			begin
				ResultQuery.Fields[col].DisplayLabel := S;
				S := '';
				inc(col);
			end
		else S := S + ColumnNames[i];
		ResultQuery.Fields[col].DisplayLabel := S;
	end;

			// спрятать столбцы с именем '-'
	for i:=0 to SpGrid.Columns.Count-1 do
		if SpGrid.Columns[i].Title.Caption = '-' then
			SpGrid.Columns[i].Visible := False;

    SearchFrame.Prepare(ResultQuery, SpGrid);
end;

function	TSpParams.MakeSelectSQL: String;
begin
	if Trim(FSelectProcName) <> '' then
		Result := 'SELECT * FROM ' + FSelectProcName
	else	Result := 'SELECT ' + IdField + ',' + SpFields + ' FROM ' +
		Table +	' WHERE NOT (' + IdField + ' BETWEEN  -10 AND 0)' +
		' ORDER BY '+ SpFields;
end;

function	TSpParams.MakePrepareSQL(Id: Integer): String;
begin
	Result := 'SELECT ' + ComboField;
	if FAdditional <> '' then Result := Result + ',' + FAdditional;
	if Trim(FSelectProcName) <> '' then
		Result := Result + ' FROM ' + FSelectProcName
	else	Result := Result + ' FROM ' + FTable;

	Result := Result + ' WHERE ' + IdField + ' = ' + IntToStr(Id);
end;

constructor TSpForm.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);

	ResultQuery.Transaction := SpReadTransaction;
	WorkQuery.Transaction := SpWriteTransaction;

	AddButton.Align := alLeft;
	ModifyButton.Align := alLeft;
	DeleteButton.Align := alLeft;
	DetailsButton.Align := alLeft;
	FindButton.Align := alLeft;
	RefreshButton.Align := alLeft;
    PrintButton.Align := alLeft;

	CancelButton.Align := alRight;
	OkButton.Align := alRight;
end;

procedure TSpForm.Init(SpParams: TSpParams);
begin
	if FormStyle = fsMDIChild then WindowState := wsMaximized
	else WindowState := wsNormal;

	Params := SpParams;
	if SpParams.FSpMode = [] then Params.SpMode := spmNormal;

        // шоб не глючило
{	if FormStyle = fsMDIChild then
		Params.SpMode := Params.SpMode - [spfSelect];}

	with Params do
	begin
		Caption := 'Довідник: ' + Title;
		if Trim(ResultQuery.SQL.Text) = '' then
			ResultQuery.SQL.Text := MakeSelectSQL;
		Refresh;

		AddButton.Visible := spfAdd in SpMode;
		ModifyButton.Visible := spfModify in SpMode;
		DeleteButton.Visible := spfDelete in SpMode;
		DetailsButton.Visible := spfDetails in SpMode;
		FindButton.Visible := spfFind in SpMode;
		OkButton.Visible := spfSelect in SpMode;

		if ReadOnly then begin
			AddButton.Visible := False;
			ModifyButton.Visible := False;
			DeleteButton.Visible := False;
		end;

		if spfMultiSelect in SpMode then
			SpGrid.Options := SpGrid.Options + [dgMultiSelect];
	end;

    SearchFrame.Prepare(ResultQuery, SpGrid);
end;

procedure TSpForm.AddButtonClick(Sender: TObject);
var
	Title, Name: String;
begin
	if Params = nil then Exit;

	if (Params.ReadOnly) or not (spfAdd in Params.SpMode) then
	begin
		MessageDlg('Занесення в цей довідник неможливе!',
			mtError,[mbOk],0);
		Exit;
	end;

	if Trim(Params.FAddFormName) <> '' then
	begin
		DoShowChangeForm(emNew);
		Exit;
	end;

	Title := 'Додати у довідник';
	if Trim(Params.Title) <> '' then
		Title := Title + ' "' + Params.Title + '"';

	if InputQuery(Title,'Нове значення:', Name) and (Trim(Name) <> '') then
	begin
		WorkQuery.Close;

		if Trim(Params.FInsertProcName) <> '' then
		with WorkQuery.SQL do
		begin
			Clear;
			Add('EXECUTE PROCEDURE ' + Params.FInsertProcName);
			Add(' ' + QuotedStr(Name));
		end
		else
		WorkQuery.SQL.Text := 'INSERT INTO ' + Params.Table + '(' +
			GetFirstField(Params.SpFields) + ') VALUES(' +
			QuotedStr(Name) + ')';

		try
			ExecQuery(WorkQuery);
		except on E:Exception do
		begin
			MessageDlg(
				'При занесенні у базу даних виникла помилка: '+
				E.Message, mtError, [mbOk], 0);
			Exit;
		end;
		end;

		Refresh;
		ResultQuery.Locate(GetFirstField(Params.SpFields),Name,[]);
	end;
end;

procedure TSpForm.DeleteButtonClick(Sender: TObject);
var
	Value: String;
begin
	if Params = nil then Exit;

	if ResultQuery.IsEmpty then
	begin
		MessageDlg('Довідник пустий!',mtError,[mbOk],0);
		Exit;
	end;

	if Params.ReadOnly or not (spfDelete in Params.SpMode) then
	begin
		MessageDlg('Вилучення з цього довідника неможливе!',
			mtError,[mbOk],0);
		Exit;
	end;

	Value := ResultQuery[ GetFirstField(Params.SpFields) ];

	if ( MessageDlg('Чи ви справді бажаєте вилучити запис "'+
		Value + '"?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
	begin
		WorkQuery.Close;

		if Trim(Params.FDeleteProcName) <> '' then
		with WorkQuery.SQL do
		begin
			Clear;
			Add('EXECUTE PROCEDURE ' + Params.FDeleteProcName);
			Add(' ' + IntToStr(ResultQuery[Params.IdField]));
		end
		else
		WorkQuery.SQL.Text := 'DELETE FROM ' + Params.Table +
			' WHERE ' + Params.IdField + '=' +
			IntToStr(ResultQuery[Params.IdField] );

		try
			ExecQuery(WorkQuery);
		except on E:Exception do
		begin
			MessageDlg('При занесенні у базу даних виникла помилка: '
				+ E.Message,mtError,[mbOk],0);
			Exit;
		end;
		end;

		Refresh;
	end;
end;

procedure TSpForm.ModifyButtonClick(Sender: TObject);
var
	Name: String;
begin
	if Params = nil then Exit;
	
	if ResultQuery.IsEmpty then
	begin
		MessageDlg('Неможливо змінити запис, бо довідник пустий',
			mtError,[mbOk],0);
		Exit;
	end;

	if Params.ReadOnly or not (spfModify in Params.SpMode) then
	begin
		MessageDlg('Модифікація цього довідника неможлива!',
			mtError,[mbOk],0);
		Exit;
	end;

	if Trim(Params.FAddFormName) <> '' then
	begin
		DoShowChangeForm(emModify);
		Exit;
	end;

	with Params do
	begin
		Name := ResultQuery[ GetFirstField(SpFields) ];
		if InputQuery('Заміна','Замінити на:',Name)
			and (Trim(Name) <> '')	then
		begin
			WorkQuery.Close;

			if Trim(Params.FUpdateProcName) <> '' then
			with WorkQuery.SQL do
			begin
				Clear;
				Add('EXECUTE PROCEDURE ');
				Add(Params.FUpdateProcName);
				Add(' ' + QuotedStr(Name));
				Add(',' + IntToStr(ResultQuery[IdField]));
			end
			else
			WorkQuery.SQL.Text := 'UPDATE ' + Table + ' SET ' +
				SpFields + ' =' + QuotedStr(Name) +
				' WHERE ' + IdField + ' = ' +
				IntToStr(ResultQuery[IdField]);
				
			try
				ExecQuery(WorkQuery);
			except on E:Exception do
			begin
				MessageDlg(
				'При занесенні у базу даних виникла помилка:' +
				E.Message, mtError, [mbOk], 0);
				Exit;
			end;
			end;

			Refresh;
		end;
       end;
end;

procedure TSpForm.SpGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
		VK_ESCAPE:	CancelButton.Click;
		VK_DELETE:	DeleteButton.Click;
		VK_F2:      ModifyButton.Click;
		VK_ADD, VK_INSERT:	AddButton.Click;
		VK_BACK:	SearchFrame.SearchEdit.Text := '';
		VK_RETURN:	begin Key := 0; OkButton.Click; end;
        ord('Z'): if (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
             try
                ShowMessage(Params.IdField + ': ' + IntToStr(ResultQuery[Params.IdField]));
             except
             end;
	end;
end;

procedure TSpForm.SpGridDblClick(Sender: TObject);
begin
	if ResultQuery.IsEmpty then
	begin
	  MessageDlg('Неможливо вибрати запис, бо довідник пустий!',mtError,[mbOk],0);
	  ModalResult := 0;
	end;
	DblClick := True;
//	OkButton.Click;
end;

procedure TSpForm.SpGridKeyPress(Sender: TObject; var Key: Char);
begin
    if ord(Key) > 31  then
        SearchFrame.SearchEdit.Text := SearchFrame.SearchEdit.Text + Key;
end;

procedure TSpForm.FindButtonClick(Sender: TObject);
var
	Name: String;
	Value:String;
begin
	if Params = nil then Exit;
	
	Value := GetFirstField(Params.SpFields);
	if InputQuery('Пошук','Шукати:',Name) and ( Trim(Name) <> '' ) then
		if not ResultQuery.Locate(Value,Name,
			[loPartialKey,loCaseInsensitive]) then
		MessageDlg('Не знайдено такого запису!',mtWarning,[mbOk],0);
end;

procedure TSpForm.OkButtonClick(Sender: TObject);
begin
	DblClick := False;
	if (Params <> nil) and not (spfSelect in Params.SpMode) then
	begin
		if spfDetails in Params.SpMode then DetailsButton.Click;
		Exit;
	end;

	if ResultQuery.IsEmpty then
	begin
		MessageDlg('Неможливо вибрати запис, бо довідник пустий!',
			mtError,[mbOk],0);
		Exit;
	end
	else    ModalResult := mrOk;
	if FormStyle = fsMDIChild then Close;
end;

procedure TSpForm.FormActivate(Sender: TObject);
begin
	SpGrid.SetFocus;
end;

procedure TSpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if FormStyle = fsMDIChild then
		Action := caFree;
end;

procedure TSpForm.FormResize(Sender: TObject);
begin
	GridResize(SpGrid);
end;

procedure TSpForm.CancelButtonClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	if FormStyle = fsMDIChild then Close;
end;

procedure TSpForm.FormCreate(Sender: TObject);
begin
	GridResize(SpGrid);
end;

procedure TSpForm.SpGridCellClick(Column: TColumn);
begin
	SearchFrame.SearchEdit.Text := '';
end;

	// показать форму на редактирование в нужном режиме
procedure TSpForm.DoShowChangeForm(Mode: TEditMode);
var
	form: TAddForm;
	fclass: TPersistentClass;
	id: Integer;
begin
	if Params = nil then Exit;
	try
		fclass := GetClass('T' + Params.FAddFormName);
		if fclass <> nil then
			Application.CreateForm(TFormClass(fclass),form);
	except
	end;
	if form = nil then Exit;

	if Mode <> emNew then id := ResultQuery[Params.IdField]
	else id := -1;

	form.Prepare(Mode,id);
	if form.ShowModal = mrOk then
	begin
		Refresh;
		if Mode = emNew then
			ResultQuery.Locate(Params.IdField,form.GetId,[]);
	end;
	form.Free;
end;

procedure TSpForm.DetailsButtonClick(Sender: TObject);
begin
	if not ResultQuery.IsEmpty and ( Trim(Params.FAddFormName) <> '' )
		and (spfDetails in Params.SpMode) then
			 DoShowChangeForm(emView);
end;

procedure TSpForm.RefreshButtonClick(Sender: TObject);
begin
	Refresh;
    SearchFrame.AllLabel.Caption := 'Клацніть тут, щоб побачити кількість записів';
end;

procedure TSpForm.SpGridMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
	if DblClick then OkButton.Click;
end;

procedure TSpForm.PrintButtonClick(Sender: TObject);
var
    form: TPrintQueryForm;
begin
    form := TPrintQueryForm.Create(Self);
    form.pDataSet := ResultQuery;
    form.pGrid := SpGrid;
    form.ShowModal;
    form.Free;
end;

end.
