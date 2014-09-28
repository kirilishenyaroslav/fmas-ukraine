{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник регалий"                              }
{         Модуль добавления/изменения регалий                                  }
{                                               ответственный: Тимофеев Антон  }
unit U_SPRegards_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, StdCtrls, SpComboBox, DB,
  IBCustomDataSet, IBQuery, Buttons, FieldControl, ExtCtrls, Mask, SpFormUnit,
  CheckEditUnit, EditControl, SpCommon, fib, U_SPRegardsDM, CheckLst,
  uFControl, uLabeledFControl, uSpravControl;

type
  TForm_SPRegards_Add = class(TForm)
    Panel1: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label_Max: TLabel;
    CE_FullName: TCheckEdit;
    SpComboBox_Group: TSpComboBox;
    FC_Group: TFieldControl;
    Label_Group: TLabel;
    FC_FullName: TFieldControl;
    Label1: TLabel;
    FC_ShortName: TFieldControl;
    CE_ShortName: TCheckEdit;
    PropertiesLabel: TLabel;
    PropListBox: TCheckListBox;
    AddButton: TSpeedButton;
    IdRaise: TqFSpravControl;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure PreparePropList;
    procedure RebuildPropList;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure IdRaiseOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
  private
    { Private declarations }
  public
    DMod:  TDMSPRegards;
    Add:Boolean;
    FormControl: TEditControl;
    idgr,id:integer;
  	PropParams: TSpParams;
    constructor Create(AOwner: TComponent; DataModule: TDMSPRegards);reintroduce;
  end;

var
  Form_SPRegards_Add: TForm_SPRegards_Add;

implementation

{$R *.dfm}

uses uCommonSP;

constructor TForm_SPRegards_Add.Create(AOwner: TComponent; DataModule: TDMSPRegards);
begin
  inherited Create(AOwner);
  Self.DMod := DataModule;
end;

procedure TForm_SPRegards_Add.OkButtonClick(Sender: TObject);
var ch,i:integer;
    id_raise:string;
begin
    FormControl.Read;

    if not FormControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;
    if Add then
     idgr:=SpComboBox_Group.GetId;
    with DMod do
      try
        if VarIsNull(idraise.Value) then id_raise:='Null'
         else id_raise:=IntToStr(idraise.Value);
        FIBWriteTransaction.StartTransaction;
        if not Add then
         begin
           FIBQuery.SQL.Text:='execute procedure sp_regards_u('+IntToStr(Id)+', '+
                              IntToStr(Idgr)+', '+QuotedStr(CE_FullName.Text)+', '+
                               QuotedStr(CE_ShortName.Text)+', '+Id_Raise+');';
           FIBQuery.ExecProc;
         end
         else
         begin
           FIBSPAddReg.SelectSQL.Clear;
           FIBSPAddReg.SelectSQL.Add('select * from sp_regards_insert('+IntToStr(idgr)+','+QuotedStr(CE_FullName.Text)+','+QuotedStr(CE_ShortName.Text)+','+Id_raise+');');
           FIBSPAddReg.Open;
           FIBSPAddReg.First;
           id:=FIBSPAddReg['Id_reg'];
         end;
    		with PropListBox do
    		for i:=0 to PropListBox.Items.Count-1 do
		    begin
			    if Checked[i] then Ch:=1
			     else Ch:=0;
			    with FIBQuery.SQL do
			    begin
				    Clear;
				    FIBDSAllProp.Locate('prop_Name',Items[i],[]);
				    Add('EXECUTE PROCEDURE SP_reg_PROPERTIES_UPDATE '+
				    IntToStr(FIBDSAllProp['Id_Propertie'])+','+IntToStr(ID)+ ','+
				    IntToStr(Ch));
			    end;
			    FIBQuery.ExecProc;
		    end;
        FIBWriteTransaction.Commit;
      except on e: EFIBInterBaseError do
      begin
        MessageDlg('Не вдалося додати запис: '+e.Message,mtError,[mbYes],0);
        FIBWriteTransaction.RollBack;
      end;
      end;
  DMod.FIBDSAllProp.Close;
  DMod.FIBDSProp.Close;
end;

procedure TForm_SPRegards_Add.CancelButtonClick(Sender: TObject);
begin
	ModalResult := mrCancel;
	{if FormStyle = fsMDIChild then }Close;
end;

procedure TForm_SPRegards_Add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMod.FIBDSAllProp.Close;
  DMod.FIBDSProp.Close;
  FormControl.Free;
  SpComboBox_Group.SaveIntoRegistry;
end;

procedure TForm_SPRegards_Add.FormCreate(Sender: TObject);
begin
  SpComboBox_Group.LoadFromRegistry;
  FormControl := TEditControl.Create;
  FormControl.Add([FC_Group, FC_FullName, FC_ShortName]);
  FormControl.Prepare(emNew);
  DMod.FIBDSProp.SelectSQL.Clear;
  DMod.FIBDSProp.SelectSQL.Add('SELECT * FROM Sp_Regards_Properties');
	PropParams := TSpParams.Create;
	with PropParams do
	begin
		Table := 'Sp_regards_properties';
		Title := 'Властивості підрозділів';
		IdField := 'Id_Propertie';
		SpFields := 'Prop_Name';
		ColumnNames := 'Властивість';
//		InsertProcName:='Sp_Dep_Prop_Insert';
//		UpdateProcName:='Sp_Dep_Prop_Update';
//		DeleteProcName:='Sp_Dep_Prop_Delete';
                SpMode := spmNormal;
	end;
end;
procedure TForm_SPRegards_Add.AddButtonClick(Sender: TObject);
var
	form: TSpForm;
begin
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	form.ShowModal;
	RebuildPropList;
	form.Free;
end;

procedure TForm_SPRegards_Add.RebuildPropList;
begin
	PropListBox.Clear;
	with DMod.FibDSAllProp do
	begin
		Close;
		Open;
		First;
		while not Eof do
		begin
			PropListBox.Items.Add(FieldValues['Prop_name']);
			Next;
		end;
	end;
    if not Add then
	with DMod.FibDSProp do
	begin
		Close;
		Open;
		PreparePropList;
	end;
end;

procedure TForm_SPRegards_Add.PreparePropList;
var
	i: Integer;
begin
	for i:=0 to PropListBox.Items.Count-1 do
		PropListBox.Checked[i] := False;
	if Add then Exit;
	with PropListBox do
	for i:=0 to Items.Count-1 do
		if DMod.FibDSProp.Locate('Prop_Name',Items[i],[]) then
			PropListBox.Checked[i]:=True;
end;
procedure TForm_SPRegards_Add.FormShow(Sender: TObject);
begin
  SPInit(DMod.FIBDatabase.Handle);
  DMod.FibDSProp.SelectSQL.Clear;
  if not Add then
   DMod.FibDSProp.SelectSQL.Add('select * from sp_reg_prop_s('+intToStr(id)+');');

	RebuildPropList;
end;

procedure TForm_SPRegards_Add.FormDestroy(Sender: TObject);
begin
  //SPDone;
end;

procedure TForm_SPRegards_Add.IdRaiseOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DMod.FIBDatabase.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 1;
            FieldValues['Actual_Date'] := Date();
            Post;
        end;

        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Raise'];
            DisplayText := sp.Output['Name'];
        end;
        sp.Free;
    end;
end;

end.
