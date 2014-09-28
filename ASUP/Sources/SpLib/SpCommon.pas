{ -internal}
{-$Id: SpCommon.pas,v 1.4 2006/02/10 16:24:27 oleg Exp $}

{****************************************************************************}
{                            ѕакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 7                     }
{                        (c) Qizz 2002-2005                                  }
{       ( ќлег ¬олков при участии ƒаниила «буривского, –одиона ћиронова )    }
{               распростран€етс€ по личной договоренности                    }
{****************************************************************************}

{         ќбщий дл€ SpLib модуль - параметры форм и подгонка Grid'а          }

unit SpCommon;

interface

uses	Forms, DBGrids, Graphics, Controls, IBQuery, SysUtils,Variants,
    IBDatabase, IBHeader, Dialogs, Clipbrd;

type
	TEditMode = ( emNew, emModify, emView );
	TFlipMode = (fmHide, fmDisable);

	TSpModeFlags = ( spfAdd, spfModify, spfDelete, spfDetails, spfFind,
		spfSelect, spfMultiSelect, spfCantRemoveFilter, spfExt);
	TSpMode = set of TSpModeFlags;

	TAddForm = class(TForm)
	public
		procedure Prepare(Mode: TEditMode; id: Integer);overload;virtual;abstract;
		function GetId: Integer;virtual;abstract;
	end;

	TReportForm = class(TForm)
	public
		procedure Prepare(TheDate, Date_Beg, Date_End: TDate);
			virtual;abstract;
	end;
const
	spmNormal = [spfAdd, spfModify, spfDelete, spfExt, spfFind];
	spmSelect = [spfAdd, spfModify, spfDelete, spfExt, spfFind, spfSelect];
	spmReadOnly = [spfFind, spfSelect];

var
	CurrentUser: Integer;
	ShowQuery: Boolean;

    SpDatabase: TIBDatabase;
    SpReadTransaction: TIBTransaction;
    SpWriteTransaction: TIBTransaction;

    RefC: Integer;

procedure GridResize(Grid : TDBGrid);
procedure QueryRefresh(query: TIBQuery);
procedure LogOn;
procedure LogOff;
function ExecQuery(query: TIBQuery): Integer;
function UniTime(Value : String) : TTime;

function ParseVar(prefix: String; VarName: String): Integer;
function StrRest(prefix: String; VarName: String): String;

procedure SpInit(Handle: Pointer);
procedure SpDone;

function MessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Word;

procedure CopyToClipboard(Str : String);

implementation

uses   StrUtils, DB, SpComboBox, StdCtrls, qFStrings;

var
	ChangeLog: Integer;

procedure CopyToClipboard(Str : String);
var
    Clip : TClipboard;
begin
    Clip := Clipboard;
    Clip.AsText := Str;
end;

function MessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Word;
var
    form: TForm;
    b: TButton;
    ModRes: Integer;
    i: Integer;
begin
    form := CreateMessageDialog(Msg, DlgType, Buttons);
    if DlgType = mtConfirmation then
        form.Caption := qFConfirmCaption;
    if DlgType = mtError then
        form.Caption := qFErrorCaption;

    for i:=0 to form.ComponentCount-1 do
        if form.Components[i] is TButton then
        begin
            b := form.Components[i] as TButton;
            if b.Name = 'Yes' then b.Caption := qFYesCaption;
            if b.Name = 'No' then b.Caption := qFNoCaption;
        end;

    ModRes := form.ShowModal;
    form.Free;

    Result := ModRes;
end;

function StrRest(prefix: String; VarName: String): String;
var
    i, len: Integer;
begin
    len := Length(prefix);
    for i:=1 to len do
        if prefix[i] <> VarName[i] then
        begin
            Result := '';
            Exit;
        end;
    Result := Copy(VarName, len+1, Length(VarName)-len);
end;

function ParseVar(prefix: String; VarName: String): Integer;
begin
    try
        Result := StrToInt(StrRest(prefix, VarName));
    except
        Result := -1;
    end;
end;

procedure SpInit(Handle: Pointer);
begin
    inc(RefC);
    if RefC > 1 then Exit;

    if SpDatabase = nil then
        SpDatabase := TIBDatabase.Create(nil);

    if SpReadTransaction = nil then
    begin
        SpReadTransaction := TIBTransaction.Create(SpDatabase);
        with SpReadTransaction.Params do
        begin
            Add('read_committed');
            Add('rec_version');
            Add('nowait');
        end;
        SpReadTransaction.DefaultDatabase := SpDatabase;
    end;

    if SpWriteTransaction = nil then
    begin
        SpWriteTransaction := TIBTransaction.Create(SpDatabase);
        SpWriteTransaction.DefaultDatabase := SpDatabase;
        with SpWriteTransaction.Params do
        begin
            Add('read_committed');
            Add('rec_version');
            Add('nowait');
        end;
    end;

    if Handle <> nil then
        SpDatabase.SetHandle(Handle);
end;

procedure SpDone;
begin
    dec(RefC);

    if RefC > 0 then Exit;

    try
        if SpComboBox.PrepareQuery.Active then
            SpComboBox.PrepareQuery.Close;
        SpComboBox.PrepareQuery.Transaction := nil;
        SpReadTransaction.Free;
        SpReadTransaction := nil;
        SpWriteTransaction.Free;
        SpWriteTransaction := nil;
        if SpDatabase <> nil then
            SpDatabase.Free;
        SpDatabase := nil;
    except
    end;
end;

function UniTime(Value : String) : TTime;
begin
    if Pos(':',Value) = 0
    then result := StrToFloat(Value)
    else result := StrToTime(Value);
end;

procedure LogOn;
begin
	inc(ChangeLog);
end;

procedure LogOff;
begin
	dec(ChangeLog);
end;


	// выполнить запрос; возможно, с записью в протокол
function ExecQuery(query: TIBQuery): Integer;
var
	i, p, ofs: Integer;
	s, f, orig, param: String;
	select, intran, needtran: Boolean;
begin
	Result := -1;
	with query do
	begin
			// сохранить оригинальный текст запроса
		orig := SQL.Text;

			// заменить параметры их значени€ми (если пишем в лог)
		if ChangeLog > 0 then
		begin
			s := SQL.Text;
			for i:=0 to ParamCount-1 do
			with Params[i] do
			begin
				case DataType of
					ftInteger:	f := IntToStr(Value);
					ftString:	f := QuotedStr(Value);
					ftFloat:	f := FloatToStr(Value);
					ftDate: f := QuotedStr(DateToStr(Value));
					ftTime: f := QuotedStr(TimeToStr(Value));
					ftDateTime:
					f := QuotedStr(DateTimeToStr(Value));
					ftBCD: f := CurrToStr(Value);
					else
					case VarType(Value) of
						varNull,varEmpty: f := 'Null';
						varInteger:	f := IntToStr(Value);
						varString:	f := QuotedStr(Value);
						varDouble,varSingle:
							f := FloatToStr(Value);
						varDate:
							if Value.Time = 0 then
							f := QuotedStr(DateToStr(Value))
							else
							f := QuotedStr(DateTimeToStr(Value));
						varCurrency: f := CurrToStr(Value);
						else	f := QuotedStr(AsString);
					end;
				end;
				ofs := 1;
				param := ':' + Name;
				repeat
					p := PosEx(param, s, ofs);
					if p = 0 then break;
					ofs := p + Length(param);
					if (ofs>Length(s)) or (UpCase(s[ofs])<'A')
						or (UpCase(s[ofs])>'Z') then
					begin
						System.Delete(s, p, Length(param));
						System.Insert(f,s,p);
					end;
			until True;

			end;
			SQL.Text := s;
		end;

			// запустить транзакцию, если нужно писать в протокол
		intran := Transaction.InTransaction;
		select :=  Pos('SELECT',Trim(UpperCase(SQL.Text))) = 1;
		needtran := ((ChangeLog > 0 ) or select) and not intran;

		if needtran then Transaction.StartTransaction;

		try
				// записать в протокол
			if ChangeLog > 0 then
			begin
				SQL.Text :=
					'EXECUTE PROCEDURE ChangeLog_Insert '
					+ IntToStr(CurrentUser) + ',' +
					QuotedStr(s);
				ExecSQL;
				SQL.Text := s;
			end;

            // выполнить запрос
			if ShowQuery then ShowMessage(SQL.Text);
			if select then
			begin
				Close;
				Open;
			end
			else ExecSQL;

		except on E:Exception do
			begin	// ошибка - вернуть все на свои места
				if ChangeLog > 0 then SQL.Text := orig;
				if Transaction.InTransaction and not intran then
					Transaction.Rollback;
				raise;
				Exit;
			end;
		end;

			// забрать возвращаемое значение
		if select then
			if query.Fields.Count <> 0 then
				Result := query.Fields[0].AsInteger;

			// потвердить транзакцию, если она не начиналась
		if Transaction.InTransaction and not intran then
			Transaction.Commit;

			// востановить оригинальный текст запроса
		if ChangeLog > 0 then SQL.Text := orig;
	end
end;

procedure QueryRefresh(query: TIBQuery);
var
	key: Variant;
begin
	if not query.IsEmpty then
	begin
		key := query.Fields[0].Value;
		query.Close;
		query.Open;
		query.Locate(query.Fields[0].FieldName,key,[]);
	end
	else
	begin
		query.Close;
		query.Open;
	end
end;

procedure GridResize(Grid : TDBGrid);
var
	i, j, s, w, max: Integer;
	OldFont: TFont;
begin
	s := 0;
	for i:=0 to Grid.Columns.Count-1 do
		s := s + Grid.Columns.Items[i].Width;

	w := Grid.ClientWidth - Grid.Columns.Count;
	if (dgIndicator in Grid.Options) then
		w := w - DBGrids.IndicatorWidth;

	for i:=0 to Grid.Columns.Count-1 do
		with Grid.Columns.Items[i] do
			Width := (Width * w ) div s;

		// сделать, чтобы полностью помещалс€ заголовок
	OldFont := Grid.Canvas.Font;
	Grid.Canvas.Font := Grid.TitleFont;
	with Grid do
	for i:=0 to Columns.Count-1 do
	with Columns[i] do
	if Visible then
	begin
		w := Canvas.TextExtent(Title.Caption).cx - Width + 4;
		if w > 0 then
		begin
				// найти самый длинный столбец
			max := 0;
			with Grid do
			for j:=1 to Columns.Count-1 do
			if Columns[j].Visible and
				(Columns[j].Width > Columns[max].Width)
			then max := j;
				// увеличить нужный, уменьшить самый длинный
			if Columns[max].Width > w then
				Columns[max].Width := Columns[max].Width - w;
			Width := Width + w;
		end;
	end;
	Grid.Canvas.Font := OldFont;
end;

initialization
//    SpInit(nil);
    RefC := 0;

finalization
//    SpDone;

end.
