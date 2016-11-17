from django.db import models
from django.db import models

# Create your models here.

class Performance(models.Model):
    district_id = models.IntegerField()
    district = models.CharField(max_length=40)
    school_id = models.IntegerField()
    school = models.CharField(max_length=70)
    academic_year = models.IntegerField()
    subject = models.CharField(max_length=25)
    subgroup = models.CharField(max_length=35)
    grade_level = models.CharField(max_length=3)
    participation_rate_2014_to_2015 = models.FloatField(null=True, blank=True)
    percentage_meets_or_exceeds_2014_to_2015 = models.FloatField(null=True, blank=True)

    def __str__(self):
        formatted = "{sch} Grade {gr} {yr}"
        return formatted.format(sch=self.school, gr=self.grade_level, yr=str(self.academic_year))


class School(models.Model):
    school_id = models.IntegerField()
    school = models.CharField(max_length=60)
    district = models.CharField(max_length=50)
    dist_id = models.IntegerField()

    def __str__(self):
        formatted = "{sch} of {dst}"
        return formatted.format(sch=self.school, dst=self.district)
