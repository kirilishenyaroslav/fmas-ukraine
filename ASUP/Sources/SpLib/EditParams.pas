{ -internal}
{-$Id: EditParams.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{            Ввод параметров и генерация формы редактирования                }
{ver 1.3}

unit EditParams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, CheckEditUnit, SpComboBox, FieldControl,
  IBQuery, DB, IBCustomDataSet;

type
  TEditFormParams = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    FormEdit: TEdit;
    UnitEdit: TEdit;
    Label3: TLabel;
    EditEdit: TEdit;
    Label4: TLabel;
    InsertEdit: TEdit;
    Label5: TLabel;
    UpdateEdit: TEdit;
    Label6: TLabel;
    FCEdit: TEdit;
    Label7: TLabel;
    VertEdit: TEdit;
    Label8: TLabel;
    HorzEdit: TEdit;
    Label9: TLabel;
    WidthEdit: TEdit;
    GetIdBox: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
	function CreateSource(form: TForm): TMemoryStream;
	function CreateForm: TForm;
  public
    { Public declarations }
  end;

var
  EditFormParams: TEditFormParams;

implementation

{$R *.DFM}

uses
EditExpertFormUnit, {Proxies,} VirtIntf, IStreams, ExptIntf, ToolIntf;
{$R templates.res}

procedure TEditFormParams.OkButtonClick(Sender: TObject);
var
	s: TMemoryStream;
	SourceStream, FormStream: TIMemoryStream;
	form: TForm;
begin
	form := CreateForm;
	s := TMemoryStream.Create;
	s.WriteComponentRes(FormEdit.Text,form);
	s.Position := 0;
	FormStream := TIMemoryStream.Create(s);
	SourceStream := TIMemoryStream.Create(CreateSource(form));
	form.Free;
	ToolServices.
		CreateModule(UnitEdit.Text + '.pas', SourceStream,FormStream,
		[cmAddToProject, cmShowSource, cmShowForm, cmMarkModified]);
end;

function TEditFormParams.CreateSource(form: TForm): TMemoryStream;
var
	ResourceSize: Integer;
	ResInstance: Longint;
	ResourceBuffer: PChar;
	CodeResource: THandle;
	s, coms, fcs, boxes, id: String;
	com: TComponent;
	i: Integer;
begin
	Result := TMemoryStream.Create;

	ResInstance := System.FindResourceHInstance(HInstance);
	ResourceSize := SizeofResource(ResInstance,
		FindResource(ResInstance, 'AddTemplate', RT_RCDATA));
	CodeResource := LoadResource(ResInstance,
		FindResource(ResInstance, 'AddTemplate', RT_RCDATA));
	ResourceBuffer := StrAlloc(ResourceSize);
	Move(LockResource(CodeResource)^, ResourceBuffer^, ResourceSize);
	s := ResourceBuffer;
	Delete(s,Pos('end.',s)+4,Length(s));

	id := (Owner as TEditExpertForm).PrimaryEdit.Text;
	if GetIdBox.Checked then
	begin
		s := StringReplace(s,'{GetIdParam}',',True',[rfReplaceAll]);
		s := StringReplace(s,'{DoGetId}',
			'if Mode=emNew then ' + id+':=LastId;',[rfReplaceAll]);
	end;
	s := StringReplace(s,'%ip', InsertEdit.Text, [rfReplaceAll]);
	s := StringReplace(s,'%up', UpdateEdit.Text, [rfReplaceAll]);
	s := StringReplace(s,'%u', UnitEdit.Text, [rfReplaceAll]);
	s := StringReplace(s,'%f', FormEdit.Text ,[rfReplaceAll]);
	s := StringReplace(s,'%e', EditEdit.Text, [rfReplaceAll]);
	s := StringReplace(s,'%p', id, [rfReplaceAll]);
	s := StringReplace(s,'%t',
		(Owner as TEditExpertForm).TableEdit.Text,[rfReplaceAll]);
	s := StringReplace(s,'%d', QuotedStr(
		(Owner as TEditExpertForm).DescEdit.Text),[rfReplaceAll]);

	boxes := '';
	coms := 'published';
	fcs := '';
	for i:=0 to form.ComponentCount-1 do
	begin
		com := form.Components[i];
		coms := coms + #13#10#9#9 + com.Name + ': ' + com.ClassName + ';';
		if com is TFieldControl then
			fcs := fcs + com.Name + ',';
		if com is TSpComboBox then
			boxes := boxes+ com.Name+'.SaveIntoRegistry;' +#13#10;
	end;

	if fcs <> '' then Delete(fcs,Length(fcs),1);
	s := StringReplace(s,'%l',fcs,[rfReplaceAll]);
	s := StringReplace(s,'published',coms,[]);
	s := StringReplace(s,'{RegSave}',boxes,[]);

	StrDispose(ResourceBuffer);
	ResourceBuffer := StrAlloc(Length(s)+1);
	StrPCopy(ResourceBuffer,s);
	Result.Write(ResourceBuffer^,Length(s));
	Result.Position := 0;

	UnlockResource(CodeResource);
	FreeResource(CodeResource);
	StrDispose(ResourceBuffer);
end;

function TEditFormParams.CreateForm: TForm;
var
	form: TForm;
	i, FieldCount, dh, dl, h, maxl, t1, t2, t3, wd: Integer;
	ctrl: TControl;
	tbl, flist: String;
	field: TField;
	query: TIBQuery;
begin
	form := TForm.Create(nil);
{$IFDEF DELPHI5}
	Proxies.CreateSubClass(form, 'T' + FormEdit.Text, TForm);
{$ENDIF}
	
	try
		dh := StrToInt(VertEdit.Text);
		dl := StrToInt(HorzEdit.Text);
		wd := StrToInt(WidthEdit.Text);
	except
		ShowMessage('Ошибка в задании числовых параметров');
		dh := 48;
		dl := 16;
		wd := 200;
	end;

	form.Font.Style := [fsBold];
	form.Position := poScreenCenter;
	form.BorderStyle := bsDialog;

	with Owner as TEditExpertForm do
	begin
		for FieldCount:=1 to FieldsGrid.RowCount do
		if Trim(FieldsGrid.Cells[0,FieldCount]) = '' then
				break;
		FieldCount := FieldCount - 1;

		h := dh;
		maxl := 0;
		flist := '';

		for i:=1 to FieldCount do
		with FieldsGrid do
		if Cells[0,i] <> PrimaryEdit.Text then
			with TLabel.Create(form) do
			begin
				Parent := form;
				Left := dl;
				Top := h;
				h := h + dh;
				Caption := Cells[4,i] + ':';
				Name := Cells[0,i] + 'Label';
				Font.Color := clGreen;
				Font.Style := [fsBold];
				if Left + Width > maxl then
					maxl := Left + Width;
				flist := flist + Cells[0,i] + ',';
			end;
		form.Height := h + 2*dh;

		if flist <> '' then Delete(flist,Length(flist),1);
		query := TIBQuery.Create(form);
		with query do
		begin
			Name := 'DetailsQuery';
			SQL.Text := 'SELECT ' + flist + ' FROM ' +
				TableEdit.Text + ' WHERE ' + PrimaryEdit.Text+
				' = :' + PrimaryEdit.Text;
		end;

		h := dh;
		for i:=1 to FieldCount do
		with FieldsGrid do
		if Cells[0,i] <> PrimaryEdit.Text then
		begin
			case UpCase(Cells[1,i][1]) of
			'D':
			begin
				ctrl := TDateTimePicker.Create(form);
				with ctrl as TDateTimePicker do
				begin
					Parent := form;
					Name := Cells[0,i] + 'Picker';
					ShowCheckBox := True;
				  	Checked := False;
				end;
				field := TDateField.Create(form);
			end;
			'C':
			begin
				ctrl := TCheckEdit.Create(form);
				with ctrl as TCheckEdit do
				begin
					Name := Cells[0,i] + 'Edit';
					t1 := Pos('(',Cells[1,i]);
					t2 := Pos(')',Cells[1,i]);
					try
						t3 := StrToInt(
						Copy(Cells[1,i],t1+1,t2-t1-1));
					except
						t3 := 0;
					end;
					MaxLength := t3;
				end;
				field := TIBStringField.Create(form);
			end;
			'L':
			begin
				ctrl := TCheckBox.Create(form);
				ctrl.Name := Cells[0,i] + 'Box';
				(ctrl as TCheckBox).Caption := '';
				field := TIBStringField.Create(form);
			end;
			'F':
			begin
				ctrl := TCheckEdit.Create(form);
				with ctrl as TCheckEdit do
				begin
					Name := Cells[0,i] + 'Edit';
					InputSet := isDigitsDot;
				end;
				field := TIBBCDField.Create(form);
			end;
			'N':
			if Trim(Cells[3,i]) <> '' then
			begin
				tbl := Copy(Cells[3,i],1,Pos('(',Cells[3,i])-1);
				ctrl := TSpComboBox.Create(form);
				ctrl.Name := Cells[0,i] + 'Box';
				with (ctrl as TSpComboBox).SpParams do
				begin
					IdField := Cells[0,i];
					SelectProcName := tbl + '_Select';
					InsertProcName := tbl + '_Insert';
					UpdateProcName := tbl + '_Update';
					DeleteProcName := tbl + '_Delete';
					ShowHint := True;
				end;
				field := TIntegerField.Create(form);
			end
			else
			begin
				ctrl := TCheckEdit.Create(form);
				with ctrl as TCheckEdit do
				begin
					Name := Cells[0,i] + 'Edit';
					InputSet := isDigits;
				end;
				field := TIntegerField.Create(form);
			end;
			else
			begin
				ctrl := nil;
				field := nil;
			end;
			end;

			if ctrl <> nil then
			with ctrl do
			begin
				Parent := form;
				Left := maxl + 3*dl;
				Top := h;
				Width := wd;
			end;

			with field do
			begin
				FieldName := Cells[0,i];
				Name := 'DetailsQuery' + FieldName;
				DataSet := query;
				if field is TIBBCDField then
				with field as TIBBCDField do
				begin
					Precision := 9;
					Size := 2;
				end;
			end;

			with TFieldControl.Create(form) do
			begin
				Parent := form;
				Left := ctrl.Left + ctrl.Width + 2;
				Top := h;
				Name := StringReplace(FCEdit.Text,'%',Cells[0,i],[]);
				Control := ctrl;
				Required :=  (Trim(Cells[2,i]) = '');
				Title := '"' + Cells[4,i] + '"';
				if ctrl is TCheckEdit then
					MaxLength :=
						(ctrl as TCheckEdit).MaxLength;
				ReadFromField := field;
			end;
			
			h := h + dh;
		end;

		form.Width := maxl + wd + 3*dh;

		with TBitBtn.Create(form) do
		begin
			Name := 'OkButton';
			Caption := 'Гаразд';
			ModalResult := mrOk;
			Height := 25;
			Width := 97;
			Top := h;
			Left := form.Width div 3;
			Font.Name := 'Arial';
			Font.Size := 12;
			Font.Style := [fsBold];
			Glyph.LoadFromResourceName(hInstance,'OkIcon');
			Default := True;
		end;

		with TBitBtn.Create(form) do
		begin
			Name := 'CancelButton';
			Caption := 'Відміна';
			ModalResult := mrCancel;
			Height := 25;
			Width := 97;
			Top := h;
			Left := 2*form.Width div 3;
			Font.Name := 'Arial';
			Font.Size := 12;
			Font.Style := [fsBold];
			Glyph.LoadFromResourceName(hInstance,'CancelIcon');
                        Cancel := True;
		end;

	end;
	Result := form;
end;

procedure TEditFormParams.FormCreate(Sender: TObject);
var
	s: String;
begin
	with Owner as TEditExpertForm do
	begin
		s := TableEdit.Text;
		if Pos('Sp_',s) = 1  then Delete(s,1,3);
		if Pos('Dt_',s) = 1 then Delete(s,1,3);
		if Pos('Ini_',s) = 1 then Delete(s,1,4);
		while Pos('_', s) > 0 do
			Delete(s,Pos('_', s),1);

		UnitEdit.Text := 'Add' + s;
		FormEdit.Text := UnitEdit.Text + 'Form';

		InsertEdit.Text := TableEdit.Text + '_Insert';
		UpdateEdit.Text := TableEdit.Text + '_Update';
	end;
end;

end.
