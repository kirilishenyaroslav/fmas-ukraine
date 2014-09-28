unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Halcn6db, DB, cxLookAndFeelPainters, ExtCtrls, StdCtrls,
  cxButtons, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    DSet: THalcyonDataSet;
    CreateHalcyonDataSet1: TCreateHalcyonDataSet;
    OpenFileEdit: TcxButtonEdit;
    cxLabel1: TcxLabel;
    SaveFileEdit: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Bevel1: TBevel;
    SaveDialog1: TSaveDialog;
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SaveFileEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 if OpenDialog1.Execute then OpenFileEdit.Text := OpenDialog1.FileName;
end;

procedure TForm1.SaveFileEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 if SaveDialog1.Execute then SaveFileEdit.Text := SaveDialog1.FileName;
end;

procedure TForm1.cxButton1Click(Sender: TObject);
var F: TextFile;
    S,TmpS: string;
    FieldName:string;
    IsEditMode:boolean;
    Num:byte;
begin
    IsEditMode := False;

    DSet.TableName := SaveFileEdit.Text;
if CreateHalcyonDataSet1.Execute then
   begin
    DSet.Open;

    AssignFile(F, OpenFileEdit.Text);
    Reset(F);
    while not Eof(F) do
      begin
        Readln(F, S);

        TmpS:=Trim(S);
        Num:=0;
        while Pos(':', TmpS) > 0 do
          begin
           TmpS[Pos(':', TmpS)]:='@';
           inc(Num);
          end;

        if Num=1 then
        begin
          if S[Length(S)]=':' then
                              begin
                                if IsEditMode then DSet.Post;
                                Dset.Append;
                                IsEditMode := True;
                              end
                              else
                               begin
                                FieldName := Trim(copy(S,1,pos(':',S)-1));
                                delete(S,1,pos(':',S));
                                case DSet.FieldByName(FieldName).DataType of
                                  ftString: DSet[FieldName] := S;
                                  ftInteger,ftSmallint,ftWord,ftLargeint: DSet[FieldName] := StrToInt(S);
                                  ftDate,ftDateTime,ftTimeStamp: DSet[FieldName] := StrToDate(S);
                                  ftFloat,ftCurrency: DSet[FieldName] := StrToFloat(S);
                                  ftBoolean:
                                      begin
                                        if Trim(S)='True' then DSet[FieldName] := True;
                                        if Trim(S)='False' then DSet[FieldName] := False;
                                      end
                                end;
                               end;
        end;
      end;
    if IsEditMode then DSet.Post;
    CloseFile(F);
    ShowMessage('Ok');
   end;
end;

procedure TForm1.cxButton2Click(Sender: TObject);
begin
Close;
end;

end.
