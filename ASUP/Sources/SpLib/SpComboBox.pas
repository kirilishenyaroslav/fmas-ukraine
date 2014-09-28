{ -internal}
{-$Id: SpComboBox.pas,v 1.4 2006/03/28 14:50:43 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2006                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{                      Компонент SpComboBox                                  }
{       список с возможностью вызова универсальной формы справочника         }
{          и хранением в реестре последних N выбранных значений              }

unit SpComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SpFormUnit,IBDataBase, IBQuery, Registry, SpCommon, Variants;
const
	DefaultSpOpenItem = '...Інше';
type

  TSpComboBox = class(TComboBox)
  private
	FItemCount:	Integer;
	FSpOpenItem:	String;
	FAutoDrop:	Boolean;
	FSpParams:	TSpParams;
	FIdArray:	array of Integer;
	FAltForm:	TSpForm;
	FAltFormName:	String;
	FAddField:	Variant;
    FType:      Variant;

	procedure	SetSpOpenItem(AName: String);
	function	GetName(Query:TIBQuery): String;
  protected
	procedure	Loaded;override;
	procedure	WndProc(var Message: TMessage);override;
	procedure	CallSpForm;
	procedure	Change;override;

  public
	constructor	Create(AOwner:TComponent);override;
	destructor 	Destroy;override;

	procedure	SaveIntoRegistry;
    procedure	LoadFromRegistry;

	function	GetId: Integer;
	function	GetAdditionalField: Variant;
 	procedure	Prepare(Id: Variant); overload;
	procedure	Prepare(Id: Variant; Name: Variant); overload;

  published
	property ItemCount: Integer read FItemCount write FItemCount;
	property SpOpenItem: String read FSpOpenItem write SetSpOpenItem;
	property AutoDrop: Boolean read FAutoDrop write FAutoDrop;
	property SpParams:TSpParams read FSpParams  write FSpParams;
	property AlternativeForm: String read FAltFormName write FAltFormName;
    property BoxType: Variant read FType write FType; 
  end;

procedure Register;

var
	PrepareQuery: TIBQuery;

implementation


procedure	TSpComboBox.WndProc(var Message: TMessage);
begin
	case Message.Msg of
		WM_KEYUP:
			if (TWMKey(Message).CharCode = VK_TAB)
				and (FAutoDrop = True) then
					DroppedDown := True;
	end;

	inherited WndProc(Message);
end;

procedure	TSpComboBox.Change;
begin
	if ( Items.Strings[ItemIndex] = FSpOpenItem ) then CallSpForm
	else inherited Change;
end;

procedure	TSpComboBox.CallSpForm;
var
	Form: TSpForm;
	fclass: TPersistentClass;
begin
	Form := nil;
	if FAltFormName <> '' then
	begin
		try
			fclass := GetClass('T' + FAltFormName);
			if fclass <> nil then
				Application.CreateForm(TFormClass(fclass),Form);
		except
		end;
	end;

	if Form = nil then Form := TSpForm.Create(Parent);
	Form.Init(SpParams);
	Form.ShowModal;
	with Form do
	if ModalResult = mrOk then
	begin
		Prepare(ResultQuery[SpParams.IdField],GetName(ResultQuery));
		if SpParams.AdditionalField <> '' then
			FAddField := ResultQuery[SpParams.AdditionalField];
	end;
    Form.Free;
end;

procedure	TSpComboBox.Prepare(Id: Variant);
begin
    Prepare(Id, '');
end;

procedure	TSpComboBox.Prepare(Id: Variant; Name: Variant);
var
	i, ind: Integer;
begin
    if VarIsNull(Id) then Id := -1;
    if VarIsNull(Name) then Name := '';

	if Id = -1 then
	begin
		ItemIndex := -1;
		Exit;
	end;

	if Name = '' then
	begin
        if PrepareQuery.Transaction = nil then
            PrepareQuery.Transaction := SpReadTransaction;

		PrepareQuery.SQL.Text := FSpParams.MakePrepareSQL(Id);
		PrepareQuery.Open;
		if PrepareQuery.IsEmpty then Exit;

		Name := GetName(PrepareQuery);

		if SpParams.AdditionalField <> '' then
			FAddField := PrepareQuery[SpParams.AdditionalField];
	end;

	if Name = '' then
	begin
		ItemIndex := -1;
		Exit;
	end;

	ind := -1;
	for i:=1 to FItemCount do
		if FIdArray[i] = Id then ind := i;

	if  ind = -1 then
	begin
		if Items.Count = FItemCount+1 then
		begin
			Items.Delete(1);
			for i:=1 to FItemCount-1 do
				FIdArray[i]:=FIdArray[i+1]
		end;
		Items.Add(Name);
		ind := Items.Count-1;
		FIdArray[ind] := Id;
	end;

	ItemIndex := ind;
	Change;
	Refresh;
end;

function	TSpComboBox.GetId: Integer;
begin
	if (ItemIndex = -1) or (Items.Strings[ItemIndex] = FSpOpenItem) then
		Result := -1
	else	Result:=FIdArray[ItemIndex];
end;

function	TSpComboBox.GetAdditionalField: Variant;
begin
	Result := FAddField;
end;

constructor TSpComboBox.Create(AOwner:TComponent);
begin
	inherited       Create(AOwner);
	FItemCount := 5;
	FAutoDrop := True;
	FSpParams := TSpParams.Create;
	FSpParams.SpMode := spmSelect;
	FAltForm := nil;
	FAltFormName := '';
	Style := csDropDownList;
end;

procedure	TSpComboBox.Loaded;
begin
	inherited	Loaded;

	SetLength(FIdArray,FItemCount+1);

	if FSpOpenItem = '' then FSpOpenItem := DefaultSpOpenItem;

	if not (csDesigning in ComponentState) then
		begin
			Items.Add(FSpOpenItem);
			FIDArray[0]:=-1;
			LoadFromRegistry;
		end;
end;

procedure	TSpComboBox.LoadFromRegistry;
var
	reg: TRegistry;
	key, ownerName: String;
	i, c: Integer;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if Owner <> nil then ownerName := Owner.Name
		else ownerName := '<unknown owner>';

		key := '\Software\Qizz Software\TSpComboBox\'+
		ExtractFileName(Application.ExeName)+'\'+ownerName+'\'+Name;
        if not VarIsNull(FType) then key := key + '\' + VarToStr(FType);

		if reg.OpenKey(key,False) then
		begin
			c := reg.ReadInteger('Count');
			if c > FItemCount then c := FItemCount;

			for i:=1 to c do
				Prepare(reg.ReadInteger(IntToStr(i)), '');
			reg.CloseKey;
		end;
	except ;
	end;
	reg.Free;
end;

procedure	TSpComboBox.SaveIntoRegistry;
var
	reg: TRegistry;
	key, ownerName: String;
	i: Integer;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if Owner <> nil then ownerName := Owner.Name
		else ownerName := '<unknown owner>';

		key := '\Software\Qizz Software\TSpComboBox\'+
		ExtractFileName(Application.ExeName)+'\'+ownerName+'\'+Name;
        if not VarIsNull(FType) then key := key + '\' + VarToStr(FType);

		if reg.OpenKey(key,True) then
		begin
			reg.WriteInteger('Count',Items.Count-1);
			for i:=1 to Items.Count-1 do
				reg.WriteInteger(IntToStr(i),FIdArray[i]);
			reg.CloseKey;
		end;
	finally
		reg.Free;
	end;
end;

destructor	TSpComboBox.Destroy;
begin
	FSpParams.Free;
	inherited Destroy;
end;

procedure Register;
begin
	RegisterComponents('Samples', [TSpComboBox]);
end;

procedure	TSpComboBox.SetSpOpenItem(AName: String);
var
	i: Integer;
begin
	i := Items.IndexOf(FSpOpenItem);
	if i <> -1 then
		Items.Strings[i] := AName;
	FSpOpenItem := AName;
end;

function	TSpComboBox.GetName(Query:TIBQuery): String;
var
	i,c: Integer;
    
	S: String;
begin
	Result := '';
	with SpParams do
	begin
		S := '';
		c := 0;
		for i:=1 to Length(ComboField) do
		if ComboField[i] = ',' then
			begin
				S := Query[Trim(S)];
				if c = 1 then S := ' (' + S;
				if c > 1 then S := ' ' + S;
				Result := Result + S;
				S := '';
				Inc(c);
			end
		else S := S + ComboField[i];
		S := Query[Trim(S)];
		if c = 1 then S := ' (' + S + ')';
		if c > 1 then S := ' ' + S + ')';
		Result := Result + S;
	end;
end;

initialization
	PrepareQuery := TIBQuery.Create(nil);

finalization
	PrepareQuery.Free;

end.
