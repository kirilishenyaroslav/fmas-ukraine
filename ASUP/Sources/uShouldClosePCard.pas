unit uShouldClosePCard;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, IBase, DB, IBCustomDataSet, IBQuery, StdCtrls, ComCtrls, Buttons,
    IBDataBase;

type
    TfmShouldClosePCard = class(TForm)
        ClosePCardQuery: TIBQuery;
        Label1: TLabel;
        BitBtn1: TBitBtn;
        Label2: TLabel;
        DateClose: TDateTimePicker;
        BitBtn2: TBitBtn;
        procedure BitBtn2Click(Sender: TObject);
        procedure BitBtn1Click(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Man: Integer;
        checkOK: Boolean;
        constructor Create(AOwner: TComponent; WriteTrans: TIBTransaction; Id_Man: Integer);
    end;
var
    fmShouldClosePCard: TfmShouldClosePCard;

implementation

{$R *.dfm}

constructor TfmShouldClosePCard.Create(AOwner: TComponent;
    WriteTrans: TIBTransaction; Id_Man: Integer);
begin
    inherited Create(AOwner);

    ClosePCardQuery.Transaction := WriteTrans;
    CheckOK := False;
    DateClose.Date := Date;
    Self.Id_Man := Id_Man;
end;

procedure TfmShouldClosePCard.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmShouldClosePCard.BitBtn1Click(Sender: TObject);
begin
    ClosePCardQuery.Transaction.StartTransaction;
    ClosePCardQuery.Close;
    ClosePCardQuery.Params.ParamValues['Id_Man'] := Id_Man;
    ClosePCardQuery.ParamByName('Date_Close').AsDate := DateClose.Date;
    ClosePCardQuery.ExecSQL;
    ClosePCardQuery.Transaction.Commit;

    CheckOK := True;
    Close;
end;

end.
