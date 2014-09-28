{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uAddNew_Object;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxMemo, cxTextEdit, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxButtonEdit, Ibase, ActnList, MainInvKartForm, uResources;

type
  TfmAddNewObject = class(TForm)
    ButtonClose: TcxButton;
    cxButtonAdd_obj: TcxButton;
    cxButtonEditObj: TcxButtonEdit;
    cxTextEditMaterial: TcxTextEdit;
    cxTextEditSize: TcxTextEdit;
    cxTextEditCoeff: TcxTextEdit;
    cxTextEditKol_vo: TcxTextEdit;
    cxTextEditSumma: TcxTextEdit;
    cxMemoObj_note: TcxMemo;
    Labelobject: TLabel;
    LabelMateriala: TLabel;
    LabelSize: TLabel;
    LabelCoeff: TLabel;
    LabelKol_va: TLabel;
    LabelSummi: TLabel;
    LabelObj_note: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    procedure ButtonCloseClick(Sender: TObject);
    procedure cxTextEditCoeffKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditObjPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEditKol_voKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure cxTextEditSummaExit(Sender: TObject);
  private
        FlagNaAdd : boolean;
        myform : TfmMainIvKartForm;
        id_nomn : int64;

        long_pole : string;
        prap_flag, d : integer;
        zpt, zpt1 : string;
  public
       constructor Create(mforma: TfmMainIvKartForm; Metka : boolean); reintroduce; overload;
  end;

var
  fmAddNewObject: TfmAddNewObject;

implementation

uses ClassInvKart;

{$R *.dfm}

constructor TfmAddNewObject.Create(mforma: TfmMainIvKartForm; metka: boolean);
var
    i : integer;
begin
    inherited Create(nil);
    myform    := mforma;
    FlagNaAdd := metka;

    Labelobject.Caption     := MAT_INV_Name;
    ButtonClose.Caption     := MAT_INV_Cansel;
    LabelMateriala.Caption  := MAT_INV_obj_material;
    LabelSize.Caption       := MAT_INV_obj_siyz;
    LabelObj_note.Caption   := MAT_INV_Primechanie;
    LabelCoeff.Caption      := MAT_INV_obj_koef;
    LabelKol_va.Caption     := MAT_INV_obj_kol_vo;
    LabelSummi.Caption      := MAT_INV_obj_sum;

    If FlagNaAdd = true then
    begin
        Caption := MAT_INV_system_name + MAT_INV_obj_caption_Add;
        cxButtonAdd_obj.Caption := MAT_INV_Add;

    end else
    begin
        Caption                 := MAT_INV_system_name + MAT_INV_obj_caption_Izm;
        id_nomn                 := myform.DataSet_NaTe_object.FieldByName('OBJ_ID_NOMN').AsInteger;
        cxButtonEditObj.Text    := myform.DataSet_NaTe_object.FieldByName('OBJ_NAME_NOMN').AsString;
        cxTextEditMaterial.Text := myform.DataSet_NaTe_object.FieldByName('NAME_MATER').AsString;
        cxTextEditSize.Text     := myform.DataSet_NaTe_object.FieldByName('SIZE_OBJ').AsString;
        cxTextEditCoeff.Text    := myform.DataSet_NaTe_object.FieldByName('COEFF_OBJ').AsString;
        cxTextEditKol_vo.Text   := myform.DataSet_NaTe_object.FieldByName('KOL_OBJ').AsString;
        cxTextEditSumma.Text    := myform.DataSet_NaTe_object.FieldByName('SUMM_OBJ').AsString;
        cxMemoObj_note.Text     := myform.DataSet_NaTe_object.FieldByName('NOTE_OBJ').AsString;

        cxButtonAdd_obj.Caption := MAT_INV_Change;
              //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditSumma.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditSumma.Clear;
                    cxTextEditSumma.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
     end;
end;



procedure TfmAddNewObject.ButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmAddNewObject.cxTextEditCoeffKeyPress(Sender: TObject;
  var Key: Char);
begin
    begin
    if cxTextEditCoeff.Text = '0,0000' then cxTextEditCoeff.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditCoeff.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditCoeff.Text) - Pos(DecimalSeparator, cxTextEditCoeff.Text) > 1) and (Pos(DecimalSeparator,cxTextEditCoeff.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
     end;
end;

procedure TfmAddNewObject.cxButtonEditObjPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 hPack     : HModule;
 SpravFunc : function (aOwner:TComponent;
                     DBHANDLE : TISC_DB_HANDLE;
                     aFS: TFormStyle;   {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству, (пока не реализовано!)}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {пока не используется }
                     aMSelect:integer; {тип выбора записей: 0 - выбор одной записи, 1 - мультивыбор записей, 2 - выбор группы }
                     aLang: integer =0 {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;
 Res:Variant;
 sResult: string;
begin
 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage(ExtractFilePath(Application.ExeName)+'SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, myform.DatabaseMain.Handle, fsNormal, 0, 0, 0, 0, 0, 0, 0);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if  VarType(Res) <> varEmpty then
 begin
  id_nomn:=Res[0];
  cxButtonEditObj.Text:=Res[1];
  cxTextEditSumma.Text:=Res[4];
 end;

end;

procedure TfmAddNewObject.cxTextEditKol_voKeyPress(Sender: TObject;
  var Key: Char);
begin
    begin
    if cxTextEditKol_vo.Text = '0,0000' then cxTextEditKol_vo.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditKol_vo.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditKol_vo.Text) - Pos(DecimalSeparator, cxTextEditKol_vo.Text) > 1) and (Pos(DecimalSeparator,cxTextEditKol_vo.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
     end;
end;

procedure TfmAddNewObject.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    begin
    if cxTextEditSumma.Text = '0,0000' then cxTextEditSumma.Text := '';

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
     end;
end;

procedure TfmAddNewObject.Action1Execute(Sender: TObject);
var
   j, id_kar, id_nom_main, id_obj, id : int64;
begin
    if cxTextEditCoeff.Text = '' then
    begin
       cxTextEditCoeff.Text := '0';
    end;
  if FlagNaAdd = true then
    begin
          if (cxButtonEditObj.Text = '') {or (cxTextEditMaterial.Text = '') or (cxTextEditSize.text = '') or (cxTextEditCoeff.Text = '')} or (cxTextEditKol_vo.Text = '') or (cxTextEditSumma.Text = '') then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
            begin
            DecimalSeparator := '.';
            id_kar      := myform.DataSetKart.FieldByName('R_ID_KART').AsVariant;
            id_nom_main := myform.DataSetKart.FieldByName('ID_NOMNS').AsVariant;
            try
              j:= AddObject(id_kar, id_nomn, id_nom_main, cxTextEditMaterial.Text, cxTextEditSize.Text, StringReplace(cxTextEditCoeff.Text,',','.',[]), StringReplace(cxTextEditKol_vo.Text,',','.',[]), StringReplace(cxTextEditSumma.Text,',','.',[]), cxMemoObj_note.Text);
            except on E:Exception
            do begin
                  MessageDlg(MAT_INV_Error_Add + E.Message + '"',mtError,[mbOk],0);
                  Application.Terminate;
               end;
            end;
            If j > 0 then
            begin
                DecimalSeparator := ',';
                id          := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
             //   myform.Special_actionExecute(Sender);
                myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
                close;
            end;
        end;
    end;
if FlagNaAdd = false then
    begin
        if (cxButtonEditObj.Text = '') {or (cxTextEditMaterial.Text = '') or (cxTextEditSize.text = '') or (cxTextEditCoeff.Text = '')} or (cxTextEditKol_vo.Text = '') or (cxTextEditSumma.Text = '') then
           begin
            ShowMessage(MAT_INV_metall_not_all_Row);
            exit;
           end
           else
        begin
            begin
                try
                    DecimalSeparator := '.';
                    id          := myform.DataSetPapka.FieldByName('ID_INV_GRP').AsVariant;
                    id_kar      := myform.DataSetKart.FieldByName('R_ID_KART').AsVariant;
                    id_obj      := myform.DataSet_NaTe_object.FieldByName('OBJ_ID').AsVariant;
                    if id_obj = null then
                    begin
                        Exit;
                    end;
                    ChangeObject (id_obj, id_kar, id_nomn, id_nom_main, cxTextEditMaterial.Text, cxTextEditSize.Text, StringReplace(cxTextEditCoeff.Text,',','.',[]), StringReplace(cxTextEditKol_vo.Text,',','.',[]), StringReplace(cxTextEditSumma.Text,',','.',[]), cxMemoObj_note.Text);
                except on E:Exception
                do begin
                  MessageDlg(MAT_INV_Error_Change + E.Message + '"',mtError,[mbOk],0);
                  Application.Terminate;
                end;
            end;
        end;
           // myform.Special_actionExecute(Sender);
            myform.DataSetPapka.Locate('ID_INV_GRP', id, []);
            close;
        end;
    end;

end;

procedure TfmAddNewObject.cxTextEditSummaExit(Sender: TObject);
var
    i : integer;
begin
        //**********************************************************************
        prap_flag := 0;
        d         := 0;
        zpt := cxTextEditSumma.Text;
        zpt1 := zpt;
        long_pole:= IntToStr(cxTextEditSumma.GetTextLen);
        for i := 1 to StrToInt(long_pole) do
        begin
            if zpt[i] <> ',' then
            begin
                prap_flag := 1;
            end;
            if zpt[i] = ',' then
            begin
                prap_flag := 0;
                d:= 1;
            end;
            if zpt[StrToInt(long_pole)-1] = ',' then
            begin
                prap_flag := 0;
                if zpt[StrToInt(long_pole)] <> '0' then
                begin
                    d:= 2;
                end;
            end;
        end;
        if prap_flag = 1 then
            begin
                    zpt := zpt+',00';
                    cxTextEditSumma.Clear;
                    cxTextEditSumma.Text :=zpt;
                    prap_flag := 0;
            end;

        if (d = 1) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1;
            end;
        if (d = 2) and (prap_flag = 0) then
            begin
                cxTextEditSumma.Clear;
                cxTextEditSumma.Text :=zpt1+'0';
                d := 0;
            end;
        //**********************************************************************
end;

end.
