class Facture {
  final String idDecaissement;
  final String idMtf;
  final String idBnf;
  final String numeroDecaissement;
  final String numeroPiece;
  final String montant;
  final String beneficiaire;
  final String numeroBeneficiaire;
  final String commentaire;
  final String dateRealisation;
  final List<Photos> photos;
  Facture({
    required this.idDecaissement,
    required this.idMtf,
    required this.idBnf,
    required this.numeroDecaissement,
    required this.numeroPiece,
    required this.montant,
    required this.beneficiaire,
    required this.numeroBeneficiaire,
    required this.commentaire,
    required this.dateRealisation,
    required this.photos,
  });
}

class Photos {
  final String idPhoto;
  final String idDecaissement;
  final String libelle;
  final String empty1;
  final String empty2;
  final String empty3;
  final String datecreation;
  final String idusrcreation;

  Photos({
    required this.idPhoto, 
    required this.idDecaissement, 
    required this.libelle, 
    required this.empty1, 
    required this.empty2, 
    required this.empty3, 
    required this.datecreation,
    required this.idusrcreation});
}
